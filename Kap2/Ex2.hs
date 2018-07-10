module Ex2 where
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


--------------------------------------------

type NotOr p q = Not (Or p q)
type AndNot p q = And (Not p) (Not q)
type NotAnd p q = Not (And p q)
type OrNot p q = Or (Not p) (Not q)

--TODO: Förstå facit

{-
deMorgan1L:: Impl (NotOr p q) (AndNot p q)
deMorgan1L p q = implIntro notor andnot
     where notor = 
           andnot =

deMorgan1R:: Impl (AndNot p q) (NotOr p q)

deMorgan2L:: Impl (NotAnd p q) (OrNot p q)

deMorgan2R:: Impl (OrNot p q) (NotAnd p q)
-}
