module Daedalus.TH.Compile where

import Data.Text(Text)
import qualified Data.Text as Text
import qualified Data.Map as Map
import Control.Exception(try)
import Control.Monad.IO.Class(liftIO)
import qualified Language.Haskell.TH as TH
import qualified Language.Haskell.TH.Syntax as TH
import System.FilePath(takeFileName, dropExtension)
import System.Directory(canonicalizePath)

import Daedalus.SourceRange(SourcePos(..))

import qualified Daedalus.VM as VM
import qualified Daedalus.VM.Backend.Haskell as VM
import qualified Daedalus.VM.Compile.Decl as VM (moduleToProgram)

import qualified Daedalus.Driver as DDL

data CompileConfing = CompileConfing
  { userMonad       :: Maybe TH.TypeQ
  , userPrimitives  :: [(Text, [TH.ExpQ] -> TH.ExpQ)]
  , userEntries     :: [String]
  }

defaultConfig :: CompileConfing
defaultConfig = CompileConfing
  { userMonad      = Nothing
  , userPrimitives = []
  , userEntries    = ["Main"]
  }

data DDLText = Inline SourcePos Text
             | FromFile FilePath

compileDDL :: DDLText -> TH.DecsQ
compileDDL = compileDDLWith defaultConfig

compileDDLWith :: CompileConfing -> DDLText -> TH.DecsQ
compileDDLWith cfg ddlText =
  do case ddlText of
       FromFile f -> do f' <- liftIO (canonicalizePath f)
                        liftIO (print f')
                        TH.addDependentFile f'
       _          -> pure ()
     mb <-
        liftIO $ try $ DDL.daedalus
           do ast <- loadDDLVM (userEntries cfg) ddlText
              let getPrim (x,c) =
                    do mb <- DDL.ddlGetFNameMaybe "Main" x
                       case mb of
                         Nothing -> DDL.ddlThrow
                            (DDL.ADriverError ("Unknown primitive: " <> show x))
                         Just f  -> pure (f,c)
              primMap <- Map.fromList <$> mapM getPrim (userPrimitives cfg)
              pure (ast,primMap)

     (ast,primMap) <- case mb of
                        Left e  -> fail =<< liftIO (DDL.prettyDaedalusError e)
                        Right a -> pure a

     let c = VM.defaultConfig { VM.userMonad = userMonad cfg
                              , VM.userPrimitives = primMap
                              }

     VM.compileModule c ast

loadDDLVM :: [String] -> DDLText -> DDL.Daedalus VM.Module
loadDDLVM roots src =
  do mo <- case src of
             Inline loc txt ->
               do let mo = "Main"
                  DDL.parseModuleFromText mo loc txt
                  pure mo
             FromFile f ->
               do let mo = Text.pack (dropExtension (takeFileName f))
                  DDL.parseModuleFromFile mo f
                  pure mo
     DDL.ddlLoadModule mo

     let specMod = "MainCore"
     DDL.passSpecialize specMod [(mo, Text.pack root) | root <- roots ]
     DDL.passCore specMod
     DDL.passDeterminize specMod
     DDL.passNorm specMod
     DDL.passVM specMod
     m <- DDL.ddlGetAST specMod DDL.astVM

     pure $ head $ VM.pModules $ VM.moduleToProgram [m]


