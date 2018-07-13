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

--Lagen om det uteslutna tredje
--TODO: gör själv

--Facit - förstår typ nu:
exc:: Or p (Not p)
exc = notElim x
     where x:: Not (Not (Or p (Not p)))
           x = notIntro f
           f:: Not (Or p (Not p)) -> And p (Not p)
           f y = andIntro (p y) (np y)
           --q = Or p (Not p)
           np:: Not (Or p (Not p)) -> Not p
           np y = notIntro (\p -> andIntro (orIntroL p) y)
           p:: Not (Or p (Not p)) -> p
           p y = notElim (nnp y)
           nnp:: Not (Or p (Not p)) -> Not (Not p)
           nnp y = notIntro (\np -> andIntro (orIntroR np) y)
           

--First, theory exploration
theory1:: (p -> p') -> (q -> q') -> (And p q -> And p' q')
theory1 ptp qtq apq = andIntro (ptp p) (qtq q)
    where p = andElimL apq
          q = andElimR apq

theory2:: (p -> p') -> (q -> q') -> (Or p q -> Or p' q')
theory2 ptp qtq opq = orElim opq fp fq
      where fp = orIntroL . ptp
            fq = orIntroR . qtq

--Some examples from the book

example0:: And p q -> And q p
example0 apq = andIntro (andElimR apq) (andElimL apq)

example1:: And q (Not q) -> p
--Från boken:
example1 aqnq = notElim (notIntro (\hyp -> aqnq))

--TODO: Theory 3 - varför felmeddelande?

{-
theory3:: (q -> p) -> (Not p -> Not q)
theory3 f np = notIntro qapnp
    where qapnp:: q -> And p (Not p)
          qapnp q = andIntro (f q) np
-}
