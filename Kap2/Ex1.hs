module Ex1 where
data And p q
data Or p q
data Impl p q
data Not p

u = undefined

andIntro       ::  p -> q -> And p q
andElimL       ::  And p q -> p
andElimR       ::  And p q -> q

andIntro = u
andElimL = u
andElimR = u


orElim       ::  Or p q -> (p -> r) -> (q -> r) -> r
orIntroL     ::  p -> Or p q
orIntroR     ::  q -> Or p q

orElim = u
orIntroL = u
orIntroR = u


implIntro      ::  (p -> q) -> Impl p q
implElim       ::  Impl p q -> p -> q

implIntro = u
implElim = u


notIntro     ::  (p -> And q (Not q)) -> Not p
notElim      ::  Not (Not p) -> p

notIntro = u
notElim = u


----------------------------------

exa:: Impl (And p q) q
exa = implIntro andElimR

{-
Truth table gives:
p | q | And p q | Impl (And p q) q
T | T | T       | T
T | F | F       | T
F | T | F       | T
F | F | F       | T
-}


exb:: Or p q -> Or q p
exb opq = orElim opq (\p -> orIntroR p) (\q -> orIntroL q)

{-
Truth table gives:
p | q | Or p q | Or q p | Or p q -> Or q p
T | T | T      | T      | T
T | F | T      | T      | T
F | T | T      | T      | T
F | F | F      | F      | T
-}

--TODO: Vad har facit att göra med truth tables? Hur blir exa och exb bevis?

--TODO: förstå facit på c
{-
exc:: forall p. Or p (Not p)
exc = notElim . nnopnp
    where nnopnp:: Not (Not (Or p (Not p)))
          nnopnp = notIntro . (\
-}
