module AnteckningarKap1 where

--import DSLsofMath.W01

type Env v s = [(v,s)]

env1 :: Env String Int
env1 = [("hej",17),("du",38)]

evalEnv :: Eq v => Env v s -> (v -> Maybe s)
evalEnv vss var = findFst vss
        where findFst ((v,s):vss)
                  |var==v    =Just s
                  |otherwise =findFst vss
              findFst [] = Nothing

