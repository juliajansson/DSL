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

---------------------------------
--We start with ornot -> notand


--Help functions:
--Från Ex1.hs: theory3
notMap:: (q -> p) -> (Not p -> Not q)
notMap q2p np = notIntro (\q -> andIntro (q2p q) np)

--From the solution - alike orIntroL and orIntroR
notp2notand:: Not p -> NotAnd p q
notp2notand = notMap andElimL

notq2notand:: Not q -> NotAnd p q
notq2notand = notMap andElimR

ornot2notand:: Impl (OrNot p q) (NotAnd p q)
ornot2notand = implIntro func
       where func:: OrNot p q -> NotAnd p q
             func onpnq = orElim onpnq notp2notand notq2notand
             

-------------------------------------------------------------------
--Next is andnot -> notor

--Help functions:
example1:: And q (Not q) -> p
example1 aqnq = notElim (notIntro (\hyp -> aqnq))

andnot2notor:: Impl (AndNot p q) (NotOr p q)
andnot2notor = implIntro func
    where func:: AndNot p q -> NotOr p q
          func andnotpq = notIntro (\opq -> orElim opq (exfuncp andnotpq) (exfuncq andnotpq))

exfuncp:: AndNot p q -> p -> And a (Not a)
exfuncp andnotpq p = example1 (andIntro p np)
       where np = andElimL andnotpq

exfuncq:: AndNot p q -> q -> And a (Not a)
exfuncq andnotpq q =  example1 (andIntro q nq)
       where nq = andElimR andnotpq

--------------------------------------------------------

--Now, notor -> andnot

notor2andnot:: Impl (NotOr p q) (AndNot p q)
notor2andnot = implIntro func
     where func:: NotOr p q -> AndNot p q
           func notorpq = andIntro (notMap orIntroL notorpq)  --np
                                   (notMap orIntroR notorpq)  --nq



-----------------------------------------------------

--TODO: notand -> ornot










{-


notand2ornot:: Impl (NotAnd p q) (OrNot p q)
notand2ornot = implIntro 

-}


             
             

