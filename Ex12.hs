data E2 a = Con a
        | Var String
        | Plus (E2 a) (E2 a)
        | Minus (E2 a) (E2 a)
        | Times (E2 a) (E2 a)
    deriving (Eq, Show)

--1a
a1:: E2 Double
a1 = Plus (Con 2.0) (Var "a")

--1b
a2:: E2 Double
a2 = Plus (Con 5.3) (Times (Var "b") (Var "c"))

--1c
a3:: E2 Double
a3 = Minus (Times (Var "a") (Plus (Var "b") (Var "c"))) (Times (Plus (Var "d") (Var "e")) (Plus (Var "f") (Var "a")))

--2a
type Env v s = [(v,s)]
type Table a = Env String a
vars:: Table Double
vars = [("a",1.5), ("b",4.8), ("c",2.4), ("d",7.4), ("e",5.8), ("f",1.7)]


--2b
varVal:: Table a -> String -> a
varVal t s | fst (head t) == s = snd (head t)
           | otherwise         = varVal (tail t) s

--2c
eval::Num a => Table a -> E2 a -> a
eval t (Con x) = x
eval t (Var s) = varVal t s
eval t (Plus x y) = (eval t x) + (eval t y)
eval t (Minus x y) = (eval t x) - (eval t y)
eval t (Times x y) = (eval t x)*(eval t y)
