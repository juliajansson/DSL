data Exp = Con Integer --Con betyder conversion, förändrings datatyp
        | Plus Exp Exp
        | Minus Exp Exp
        | Times Exp Exp
        | Var String  --Tillagd i 3 
        deriving (Eq, Show)

--1a
a1 :: Exp
a1 = Plus (Con 2) (Con 2)

--1b
a2 :: Exp
a2 = Plus a1 (Times (Con 7) (Con 9))

--1c
a3 :: Exp
a3 = Minus (Times (Con 8) (Plus (Con 2) (Con 11)))
           (Times (Plus (Con 3) (Con 7)) (Plus a1 a2))

--2
eval :: (String -> Integer) -> Exp -> Integer
eval f (Con i) = i
eval f (Plus a b) = (eval f a) + (eval f b)
eval f (Minus a b) = (eval f a) - (eval f b)
eval f (Times a b) = (eval f a)*(eval f b)
eval f (Var s) = f s --Tillagd i 3

--3
--Uppdaterade där uppe
c1 :: Exp
c1 = Times (Minus (Var "x") (Con 15)) (Times (Plus (Var "y") (Con 12)) (Var "z"))

varVal:: String -> Integer
varVal "x" = 5
varVal "y" = 8
varVal "z" = 13 
