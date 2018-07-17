module Ex5 where
data Empty
type Not p = p -> Empty

isEmpty:: Empty -> Empty
isEMpty evE = evE

--TODO: Implement notIntro
{-
notIntro:: (p -> (q, q -> Empty)) -> (p -> Empty)
notIntro f = g

f:: p -> (q, q -> Empty)
f p = 
-}

contraHey:: Empty -> p
contraHey evE = case evE of {}

--TODO: Prove this
{-
ex1:: (q, q -> Empty) -> p
ex1 = 
-}
