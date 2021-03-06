data E = Add E E
       | Mul E E
       | Con Integer
       deriving Eq

class IntExp t where
  add:: t -> t -> t
  mul:: t -> t -> t
  con:: Integer -> t

foldE:: (s -> s -> s) -> (s -> s -> s) -> (Integer -> s) -> (E -> s)
foldE add mul con = r
  where r (Add x y) = add (r x) (r y)
        r (Mul x y) = mul (r x) (r y)
        r (Con i)   = con i

foldIE:: IntExp t => E -> t
foldIE = foldE add mul con

evalE1:: E -> Integer
evalE1 = foldE (+) (*) fromInteger

evalE2:: Num a => E -> a
evalE2 = foldE (+) (*) fromInteger

instance IntExp E where
  add = Add
  mul = Mul
  con = Con

instance IntExp Integer where
  add = (+)
  mul = (*)
  con = id

seven:: IntExp a => a
seven = add (con 3) (con 4)

testI:: Integer
testI = seven

testE:: E
testE = seven

check:: Bool
check = and [testI == 7, (testE == Add (Con 3) (Con 4))]
