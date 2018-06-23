--Lattice
module Ex4 where
import Data.Maybe
import Test.QuickCheck

data L l = Var l
         | Sup (L l) (L l)
         | Inf (L l) (L l)
         deriving(Eq, Show, Ord)

type Env l a = [(l,a)]

evalL:: (Eq l, Ord a) => L l -> Env l a -> a
evalL f env =
    case f of
       Var l -> fromMaybe (error "no such variable") $ lookup l env
       Sup e1 e2 -> max (evalL e1 env) (evalL e2 env)
       Inf e1 e2 -> min (evalL e1 env) (evalL e2 env)
{-
checkAssoc:: (Eq l, Ord a) => (L l -> L l -> L l) -> a -> a -> a -> Env l a -> a-> Bool
checkAssoc op x y z env = evalL (op (op (Var x) (Var y)) (Var z)) env == evalL  (op (Var x) (op (Var y) (Var z))) env
-}

checkAssoc:: Eq a => (a->a->a)->a->a->a->Bool
checkAssoc op x y z = op (op x y) z  ==  op x (op y z)

main = do quickCheck (checkAssoc (max :: Int -> Int -> Int))
          quickCheck (checkAssoc (min :: Int -> Int -> Int))
