module Ex8 where
--import DSLsofMath.CSem

data ComplexSyn r = ToCartesian r r
                  | ComplexSyn r :+: ComplexSyn r
                  | ComplexSyn r :*: ComplexSyn r
                  deriving (Eq, Show)

toComplexSyn:: Num a => a -> ComplexSyn a
toComplexSyn x = ToCartesian x 0

{-
evalCSyn:: Num r => ComplexSyn r -> CSem.ComplexSem r
evalCSyn (ToCartesian x y) = CS (x,y)
evalCSyn (l :+: r) = evalCSyn l +. evalCSyn r
evalCSyn (l :*: r) = evalCSyn l *. evalCSyn r
-}

instance Num a => Num (ComplexSyn a) where
   (+) = (:+:)
   (*) = (:*:)
   fromInteger = fromIntegerCS

fromIntegerCS:: Num r => Integer -> ComplexSyn r
fromIntegerCS = toComplexSyn . fromInteger

simp:: (Num r, Eq r) => ComplexSyn r -> ComplexSyn r
simp expr | expr == expr' = expr
          | otherwise     = simp expr'
     where expr' = simpStep expr

simpStep:: (Num r, Eq r) => ComplexSyn r -> ComplexSyn r
simpStep (ToCartesian 0 0 :+: w) = w
simpStep (w :+: ToCartesian 0 0) = w
simpStep (ToCartesian 0 0 :*: w) = 0
simpStep (w :*: ToCartesian 0 0) = 0
simpStep w = w

test0:: ComplexSyn Integer
test0 = 0 + 1

test1 = 0*test0


