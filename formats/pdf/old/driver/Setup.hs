{-# Language OverloadedStrings #-}
{-# Language BlockArguments #-}

import System.Directory
import System.IO
import System.Posix.Temp(mkstemps)
import Control.Exception(catches,Handler(..))

import Distribution.Simple
import Distribution.Simple.Setup
import Distribution.Types.HookedBuildInfo

import qualified Data.Map as Map
import qualified Data.Text

import Daedalus.Driver
import Daedalus.DriverHS
import Daedalus.Type.AST
import Daedalus.Compile.LangHS



main :: IO ()
main = defaultMainWithHooks simpleUserHooks
  { preBuild = \_ _ ->
      do putStrLn "Compiling DDL"
         compileDDL
         pure emptyHookedBuildInfo
  }


compileDDL :: IO ()
compileDDL =
  daedalus
  do ddlSetOpt optSearchPath [ "spec"  -- new ddl modules here
                             ]
     let mods = [ "PdfDemo", "PdfValidate", "PdfDOM"]
     mapM_ ddlLoadModule mods
     let todo = mods
                -- Varying from ../pdf-cos/Setup.hs here:
                --  we only generate hs for the listed files, not any dependencies
     ddlIO $
       mapM putStrLn $ [ "daedalus generating .hs for these .ddl modules:"
                       , "  (efficiently: no updates when file contents would be equal)"
                       ]
                       ++ map (("  " ++) . Data.Text.unpack) todo
                       ++ [""]
     cfg <- ddlIO (moduleConfigsFromFile mempty "CodeGenConfig.conf")
     let saveHS' = saveHSCustomWriteFile smartWriteFile
                   -- more efficient replacement for 'saveHS'

     mapM_ (saveHS' (Just "src/spec") cfg) todo

  `catches` [ Handler \d -> putStrLn =<< prettyDaedalusError d
            , Handler \d -> print (ppParseError d)
            ]

  where

  -- XXX: untested and currently unused
  _roots :: [(ModuleName,Ident)]
  _roots = [ ("PdfDemo", "CatalogIsOK")
           , ("PdfDemo", "TopDeclCheck")
           , ("PdfDemo", "ResolveObjectStreamEntryCheck")
           , ("PdfDOM",  "DOMTrailer")
           ]

-- equivalent to writeFile except that file access dates untouched when file-data unchanged.
smartWriteFile :: FilePath -> String -> IO ()
smartWriteFile outFile s =
  do
  exists <- doesFileExist outFile
  if not exists then
    writeFile outFile s
  else
    do
    hOutfile <- openFile outFile ReadMode
    s' <- hGetContents hOutfile
    if s' == s then hClose hOutfile
               else do
                    (tmpFile,hTmpFile) <- mkstemps "swf" "temp"
                    hPutStr hTmpFile s
                    hClose hTmpFile
                    hClose hOutfile
                    renameFile tmpFile outFile

  -- FIXME: duplicated in pdf-cos/Setup.hs but the solution is to move it to where??


