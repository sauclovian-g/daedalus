-- Copied from hobbit
{-# Language DeriveGeneric, DeriveAnyClass, DeriveLift #-}
module Daedalus.BDD where

import GHC.Generics (Generic)
import Control.DeepSeq (NFData)
import Daedalus.Panic(panic)
import Data.Bits(testBit)
import Data.List(groupBy,sortBy)
import qualified Language.Haskell.TH.Syntax as TH

-- Ordered binary decision diagrams --------------------------------------------
type Var            = Int
data BDD            = F | T | ITE Var BDD BDD
                      deriving (Eq,Show,NFData,Generic,TH.Lift)


simp :: [(Var,Bool)] -> BDD -> BDD
simp _xs F = F
simp _xs T = T
simp xs (ITE x t e) = case lookup x xs of
                        Just True  -> simp xs t
                        Just False -> simp xs e
                        Nothing    -> ITE x (simp ((x,True) : xs) t) 
                                            (simp ((x,False): xs) e)

-- | if-then-else on BDD.  This is the basic building block for other oprations.
ite        :: BDD -> BDD -> BDD -> BDD
ite T t _   = t
ite F _ e   = e
ite p t e   = let x   = maximum [ x' | ITE x' _ _ <- [p,t,e] ]
                  t'  = ite (with x True  p) (with x True  t) (with x True  e)
                  e'  = ite (with x False p) (with x False t) (with x False e)
              in if t' == e' then t' else ITE x t' e'

  where
  with x b expr =
    case expr of
      ITE y bdd1 bdd2 | x == y  -> if b then bdd1 else bdd2
      _                         -> expr




-- Bit patterns ----------------------------------------------------------------
type Width          = Int

-- A `Pat` describes the set of bit-vectors that will match a pattern.
data Pat            = Pat { width :: Width, bdd :: BDD }
                      deriving (Eq,Generic,NFData,TH.Lift)

-- | A wild-card patterns (the whole set)
pWild              :: Width -> Pat
pWild n             = Pat n T             -- always match

-- | A pattern that matches nothing (the empty set)
pFail              :: Width -> Pat
pFail n             = Pat n F             -- never match

-- | A pattren that succeeds if the parameter pattern fails (complement)
pNot               :: Pat -> Pat
pNot (Pat n p)      = Pat n (ite p F T)  -- match if argument does not match

-- | A pattern that succeeds if both pattern succeed (intersection)
pAnd               :: Pat {-n-} -> Pat {-n-} -> Pat {-n-}
pAnd (Pat m p) (Pat n q)
  | m == n          = Pat m (ite p q F)   -- match if both patterns matchs
  | otherwise       = bug "pAnd"
                          ("Different widths: " ++ show m ++ " vs. " ++ show n)

-- | A pattern that succeeds if either pattern succeed (union)
pOr          :: Pat {-n-} -> Pat {-n-} -> Pat {-n-}
pOr (Pat m p) (Pat n q)
  | m == n          = Pat m (ite p T q)   -- match if one of the pats. matches
  | otherwise       = bug "pOr"
                          ("Different widths: " ++ show m ++ " vs. " ++ show n)

-- | An N-ary version of "pOr"
pOrs               :: Width -> [Pat] -> Pat
pOrs w ps           = foldr pOr (pFail w) ps

-- | An N-ary version of "pAnd"
pAnds              :: Width -> [Pat] -> Pat
pAnds w ps          = foldr pAnd (pWild w) ps

-- | Change the width of a pattern by adding padding (uncheckd stuff)
-- on the right.
pPadR              :: Pat {-n-} -> {-m::-} Width -> Pat {-m+n-}
pPadR p 0           = p
pPadR (Pat n p) m   = Pat (m+n) (up p)
  where up (ITE x l r)  = ITE (x+m) (up l) (up r)
        up t            = t

-- | Change the width of a pattern by adding padding (uncheckd stuff)
-- on the left.
pPadL              :: Pat {-n-} -> {-m::-} Width -> Pat {-m+n-}
pPadL (Pat n p) m   = Pat (m+n) p


-- | Match if upper bits match p, and lower bits match q
pSplit             :: Pat {-m-} -> Pat {-n-} -> Pat {-m+n-}
pSplit p q          = (p `pPadR` (width q)) `pAnd` (q `pPadL` (width p))

-- | An N-ary version of "pSplit"
pSplits            :: [Pat] -> Pat
pSplits ps          = foldr pSplit (pWild 0) ps

-- | Match a specific single bit
pBool              :: Bool -> Pat {-1-}
pBool False         = Pat 1 (ITE 0 F T)
pBool True          = Pat 1 (ITE 0 T F)

-- | Match if bits are a particular 2s complement integers
pInt               :: {-n::-} Width -> Integer -> Pat {-n-}
pInt 0 _            = pWild 0
pInt n x            = pInt (n-1) (x `div` 2) `pSplit` pBool (odd x)

-- | Match if bits are (unsigned) larger than the given number 
pGreater           :: {-n::-} Width -> Integer -> Pat {-n-}
pGreater 0 _        = pFail 0
pGreater n l        = (pGreater n1 l2 `pSplit` pWild 1) `pOr` also
  where
  l2                = l `div` 2
  n1                = n - 1
  also 
    | even l        = pInt n1 l2 `pSplit` pBool True
    | otherwise     = pFail n

pGreaterEq :: {-n::-} Width -> Integer -> Pat {- n -}
pGreaterEq n l      = pGreater n l `pOr` pInt n l

pLess :: {-n::-} Width -> Integer -> Pat {- n -}
pLess n l           = pNot (pGreaterEq n l)

pLessEq :: {-n::-} Width -> Integer -> Pat {- n -}
pLessEq n l         = pNot (pGreater n l)

-- | Drop some bits from the left
pDropL               :: Pat {-n-} -> {-m::-} Width -> Pat {-n-m-}
pDropL (Pat n p) m 
  | m <= n          = Pat w' (trunc p)
  | otherwise       = bug "pDropL" "Dropped too much"
  where
  w'                = n - m
  trunc (ITE x l r) 
    | x >= w'       = trunc (ite l T r)
  trunc t           = t

-- | Drop some bits from the right
pDropR     :: Pat {-n-} -> {-m::-} Width -> Pat {-n-m-}
pDropR (Pat n p) m
  | m <= n          = Pat w' (trunc p)
  | otherwise       = bug "pDropR" "Dropped too much"
  where
  w'                = n - m
  trunc (ITE x l r)
    | x >= m        = let l' = trunc l
                          r' = trunc r
                      in if l' == r' then l' else ITE (x-m) l' r'
    | otherwise     = T
  trunc t           = t

-- | Shift a pattern by the given amount to the left
pShiftL            :: Pat {-m-} -> Width -> Pat {-m-}
pShiftL p n         = (p `pSplit` pInt n 0) `pDropL` n

-- | Shift a pattern by the given amount to the right
pShiftR            :: Pat {-m-} -> Width -> Pat {-m-}
pShiftR p n         = (pInt n 0 `pSplit` p) `pDropR` n


-- | Place a constraint on a field of a pattern.
-- Property: o + m <= n
pField             :: {-o::-} Width -> Pat {-m-} -> Pat {-n-} -> Pat {-m-}
pField o f p
  | o + m <= n      = p `pAnd` (f `pPadL` (n-m-o) `pPadR` o)
  | otherwise       = bug "pField" "Field too large"
  where
  m                 = width f
  n                 = width p 


instance Show Pat where
  show p  = unlines (showPat p)

showPat            :: Pat -> [String]
showPat (Pat w T)   = [replicate (fromIntegral w) '_']
showPat (Pat _ F)   = []
showPat (Pat w f@(ITE v p q))
  | w' > v          = [ '_' : x | x <- showPat (Pat w' f) ]
  | otherwise       = [ '0' : x | x <- showPat (Pat w' q) ]
                   ++ [ '1' : x | x <- showPat (Pat w' p) ]
    where w'        = w - 1


data PatTest = PatTest
  { patMask  :: Integer     -- ^ Mask
  , patValue :: Integer     -- ^ Expected value after masking
  , patWidth :: Width
  } deriving (Eq)

instance Show PatTest where
  show p = zipWith jn (toBits (patMask p)) (toBits (patValue p))
    where
    w         = fromIntegral (patWidth p) :: Int
    jn m v    = if m == '0' then '_' else v
    toBits x  = [ if testBit x i then '1' else '0'
                | i <- reverse (take w [0..])
                ]

-- | The result groups each mask to the possible values.
groupTestsByMask :: [PatTest] -> [(Integer,[Integer])]
groupTestsByMask xs =
  [ (x, map fst y) | (x,y) <- groupTestsByMask' (zip xs (repeat ())) ]

-- | Assumes the order of the tests is important.
groupTestsByMask' :: [(PatTest,a)] -> [(Integer, [(Integer, a)])]
groupTestsByMask' = map rearrange . groupBy sameMask
  where
  sameMask (s,_) (t,_) = patMask s == patMask t
  cmpVal (s,_) (t,_)   = compare s t
  rearrange xs         = ( patMask (fst (head xs))
                         , sortBy cmpVal [ (patValue t, a) | (t,a) <- xs ]
                         )

noTest :: Width -> PatTest
noTest w = PatTest { patMask = 0, patValue = 0, patWidth = w }

-- | Extend test with a 1 in most significant position
cons1 :: PatTest -> PatTest
cons1 pt = PatTest { patMask  = patMask  pt + one
                   , patValue = patValue pt + one
                   , patWidth = patWidth pt + 1
                   }
  where
  one = 2^patWidth pt

-- | Extend test with a 0 in most significant position
cons0 :: PatTest -> PatTest
cons0 pt = PatTest { patMask  = patMask  pt + one
                   , patValue = patValue pt
                   , patWidth = patWidth pt + 1
                   }
  where
  one = 2^patWidth pt

-- | Extend test with a wild card in most significant position
consW :: PatTest -> PatTest
consW pt = PatTest { patMask  = patMask  pt
                   , patValue = patValue pt
                   , patWidth = patWidth pt + 1
                   }

-- | Returns pt
-- @x `matches` pt = patValue pt == (x .&. patMask pt)@
patTests            :: Pat -> [PatTest]
patTests (Pat w T)   = [noTest w]
patTests (Pat _ F)   = []
patTests (Pat w f@(ITE v p q))
  | w' > v          = map consW (patTests (Pat w' f))
  | otherwise       = map cons0 (patTests (Pat w' q))
                   ++ map cons1 (patTests (Pat w' p))
    where w' = w - 1

-- | Compute tests for a pattern, assuming that the first pattern holds.
patTestsAssuming :: Pat -> Pat -> [PatTest]
patTestsAssuming univ (Pat w shape) =
  case shape of
    T       -> [noTest w]
    F       -> []
    ITE v p q
      | w' > v -> map consW (patTestsAssuming subUniv (Pat w' shape))
      | otherwise ->
        case pDropR univ w' of
          Pat _ F           -> []
          Pat _ (ITE _ T F) -> map consW ifThen
          Pat _ (ITE _ F T) -> map consW ifElse
          _                 -> map cons0 ifElse ++ map cons1 ifThen
      where
      w'      = w - 1
      subUniv = pDropL univ 1
      ifThen  = patTestsAssuming subUniv (Pat w' p)
      ifElse  = patTestsAssuming subUniv (Pat w' q)

patTestsAssumingInOrder :: Pat -> [(Pat,a)] -> [(PatTest,a)]
patTestsAssumingInOrder univ opts =
  case opts of
    [] -> []
    (p,a) : ps ->
      [ (t,a) | t <- patTestsAssuming univ p ] ++
      patTestsAssumingInOrder (pNot p `pAnd` univ) ps

pr :: Pat -> IO ()
pr x = putStrLn $ unlines $ showPat x

willAlwaysMatch :: Pat -> Bool
willAlwaysMatch (Pat _ T) = True
willAlwaysMatch _         = False

willAlwaysFail :: Pat -> Bool
willAlwaysFail (Pat _ F)  = True
willAlwaysFail _          = False

-- | Useful for checking for overlapping patterns
willMatchIf :: Pat -> Pat -> Bool
p `willMatchIf` q         = willAlwaysFail (q `pAnd` pNot p)

-- | Will this pattern match a specific (2s complements) number?
willMatch :: Integral n => Pat -> n -> Bool
p `willMatch` n       = p `willMatchIf` pInt (width p) (fromIntegral n)



-- Checks ----------------------------------------------------------------------

goodBDD            :: Width -> BDD -> Bool
goodBDD n (ITE x l r) 
  | x < n           = goodBDD x l && goodBDD x r
  | otherwise       = False
goodBDD _ _         = True

goodPat            :: Pat -> Bool
goodPat (Pat n p)   = goodBDD n p

bug :: String -> String -> a
bug a b = panic a [b]

--------------------------------------------------------------------------------


