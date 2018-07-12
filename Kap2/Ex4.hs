module Ex4 where
type And p q = (p,q)

andIntro:: p -> q -> And p q
andIntro p q = (p,q)

andElimL:: And p q -> p
andElimL s = fst s

andElimR:: And p q -> q
andElimR s = snd s

type Impl p q = (p -> q)

implIntro:: (p -> q) -> Impl p q
implIntro f = f

implElim:: Impl p q -> p -> q
implElim f = f

type Or p q = Either p q

--How to do or stuff? either function - pattern matching

--orElim:: Or p q -> (p -> r) -> (q -> r) -> r

orIntroL:: p -> Or p q
orIntroL p = Left p

orIntroR:: q -> Or p q
orIntroR q = Right q
