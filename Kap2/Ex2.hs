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

--Help functions:
--Från Ex1.hs: theory3
notMap:: (q -> p) -> (Not p -> Not q)
notMap q2p np = notIntro (\q -> andIntro (q2p q) np)

--From the solution - alike orIntroL and orIntroR
notp2notand:: Not p -> NotAnd p q
notp2notand = notMap andElimL

notq2notand:: Not q -> NotAnd p q
notq2notand = notMap andElimR

--TODO: Förstå facit

{-
notor2andnot:: Impl (NotOr p q) (AndNot p q)
-}

{-
andnot2notor:: Impl (AndNot p q) (NotOr p q)

notand2ornot:: Impl (NotAnd p q) (OrNot p q)
-}

ornot2notand:: Impl (OrNot p q) (NotAnd p q)
ornot2notand = implIntro func
       where func:: OrNot p q -> NotAnd p q
             func onpnq = orElim onpnq notp2notand notq2notand
             
             

