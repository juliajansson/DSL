{-# LANGUAGE EmptyCase #-}
module Ex5 where
data Empty
type Not p = p -> Empty
type Fals = Empty
type Tru = Not Fals

idEmpty:: Empty -> Empty -- Tru
idEmpty evE = evE

notIntro:: (p -> (q, q -> Empty)) -> (p -> Empty)
notIntro f x = y
     where (a, b) = f x
           y = b a 



contraHey:: Empty -> p
contraHey evE = case evE of {}

--TODO: Prove this
{-
ex1:: (q, q -> Empty) -> p
ex1 = 
-}
