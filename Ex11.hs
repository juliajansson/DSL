data Exp = Con Integer --Con betyder conversion, förändrings datatyp
        | Exp 'Plus' Exp
        | Exp 'Minus' Exp
        | Exp 'Times' Exp
        deriving (Eq, Show)

--1a
a1 :: Exp
a1 = Plus 2 2

--1b
a2 :: Exp
a2 = Plus a1 (Times 7 9)

--1c
a3 :: Exp
a3 = Minus (Times 8 (Plus 2 11)) (Times (Plus 3 7) (Plus a1 a2))

