module Daedalus.VM.GraphViz where

import Data.Map (Map)
import qualified Data.Map as Map
import Data.Char(isAlphaNum)

import Daedalus.PP(pp)
import Daedalus.VM


data GraphStyle = OnlyCalls
                | Everything
                  deriving Eq

toGraphViz :: GraphStyle -> Program -> String
toGraphViz sty p = unlines
  $ "digraph G {"
  : "size=\"6,4\";"
  : "ratio=\"fill\";"
  : "graph [splines=true overlap=false];"
  : concat (zipWith (doFun sty funMap) [1..] allFuns)
  ++ ["}"]
  where
  allFuns = [ f | m <- pModules p, f <- mFuns m ]
  funMap = Map.fromList [ (vmfName f, f) | m <- pModules p, f <- mFuns m ]

node :: Label -> String
node = map esc . show . pp
  where
  esc c
    | isAlphaNum c = c
    | otherwise = '_'

doFun :: GraphStyle -> Map FName VMFun -> Int -> VMFun -> [String]
doFun sty funMap n fun =
    ("subgraph cluster_" ++ show n ++ " {")
  : ("label=\"" ++ show (pp (vmfName fun)) ++ "\";")
  : "color=\"#0000000A\";"
  : "style=\"filled\";"
  : [ l | b <- Map.elems (vmfBlocks fun), l <- edge sty funMap b ]
  ++ ["}"]

edge :: GraphStyle -> Map FName VMFun -> Block -> [String]
edge sty funMap b =
  case blockTerm b of
    Jump JumpPoint { jLabel = l } ->
      [ edgeTo black "goto" l | sty == Everything ]
    JumpIf _ (JumpCase mp)
      | sty == Everything ->
        map (edgeTo black "case" . jLabel . jumpTarget) (Map.elems mp)
      | otherwise -> []

    CallPure f c _   -> doCall red f [c]
    Call f _ c1 c2 _ -> doCall red f [c1,c2]
    TailCall f _ _   -> doCall green f []

    Yield -> []
    ReturnNo -> []
    ReturnYes _ -> []
    ReturnPure _ -> []

  where
  me = node (blockName b)
  black = "#000000FF"
  red   = "#FF0000FF"
  green = "#00FF00FF"

  edgeTo c l x = me ++ " -> " ++ node x ++ "[ label=" ++ show l ++
                                  " color=" ++ show c ++ "];"

  doCall c f xs =
    case Map.lookup f funMap of
      Nothing  -> error "Missing function"
      Just fu  -> edgeTo c "call" (vmfEntry fu)
                : [ edgeTo black l (jLabel x)
                                    | (l,x) <- zip ["fail","return"] xs
                                    , sty == Everything ]
