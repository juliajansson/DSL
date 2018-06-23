module Ex3 where
--1

import Data.Maybe
import Test.QuickCheck
test:: Int -> Bool
test x = x<173

main = quickCheck test


--
data SR v = Var v --Variables of type v
          | Plus (SR v) (SR v) --Addition
          | Zero --The identity for addition
          | Times (SR v) (SR v) --Multiplication
          | One --The identity for multiplication
          deriving (Read, Show, Eq, Ord)

--2 General evaluator
type Env v a = [(v,a)] --Mapping variables of type v to type a, say v is String

evalSR:: (Eq v, Num a) => SR v -> Env v a -> a
evalSR f env =
    case f of
      Var v -> fromMaybe (error "no such variable") $ lookup v env
      Zero  -> 0
      One -> 1
      Plus e1 e2 -> evalSR e1 env + evalSR e2 env
      Times e1 e2 -> (evalSR e1 env)*(evalSR e2 env)

--Specifika, men jag vet hur man kan generalisera mer
--Antag nu v=String, a=Integer

checkComm:: Integer -> Integer -> Bool
checkComm a b = evalSR (Plus (Var "a") (Var "b")) env == evalSR (Plus (Var "b") (Var "a")) env
    where env = [("a",a),("b",b)]

checkAssoc:: (SR String -> SR String -> SR String) -> Integer -> Integer -> Integer -> Bool
checkAssoc op a b c = evalSR (op (op (Var "a") (Var "b")) (Var "c")) env == evalSR (op (Var "a") (op (Var "b") (Var "c"))) env
    where env = [("a",a),("b",b),("c",c)]

checkIdentityL:: SR String -> (SR String -> SR String -> SR String) -> Integer -> Bool
checkIdentityL e op a = evalSR (op e (Var "a")) env == evalSR (Var "a") env
    where env = [("a",a)]

checkIdentityR:: SR String -> (SR String -> SR String -> SR String) -> Integer -> Bool
checkIdentityR e op a = evalSR (op (Var "a") e) env == evalSR (Var "a") env
    where env = [("a",a)]


checkDistribL :: Integer -> Integer -> Integer -> Bool
checkDistribL a b c =
    evalSR (Times va (Plus vb vc)) env ==
    evalSR (Plus (Times va vb) (Times va vc)) env
  where  env = [("a", a), ("b", b), ("c", c)]
         va = Var "a"
         vb = Var "b"
         vc = Var "c"

checkDistribR :: Integer -> Integer -> Integer -> Bool
checkDistribR a b c =
    evalSR (Times (Plus va vb) vc) env  ==
    evalSR (Plus (Times va vc) (Times vb vc)) env
  where  env = [("a", a), ("b", b), ("c", c)]
         va = Var "a"
         vb = Var "b"
         vc = Var "c"

checkZeroAnnihilatesL :: Integer -> Bool
checkZeroAnnihilatesL a = evalSR (Times Zero (Var "a")) env == evalSR Zero env
  where env = [("a", a)]

checkZeroAnnihilatesR :: Integer -> Bool
checkZeroAnnihilatesR a = evalSR (Times (Var "a") Zero) env == evalSR Zero env
  where env = [("a", a)]

