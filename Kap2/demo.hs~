--Exercise 1.3 commutative Monoid - already done

data SR v = Add (SR v) (SR v)
        | Mul (SR v) (SR v)
        | Zero
        | One
        | Var v
        deriving (Show)

{-
eval:: (r -> r -> r) -> (r -> r -> r) -> r -> r -> (v -> r) -> SR -> r
eval add mul zero one f = e
  where
    e (Add x y) = add (e x) (e y)
    e (Mul x y) = mul (e x) (e y)
    e Zero      = zero
    e One       = one
    e Var       = f
-}

class SemiRing r where
  add:: r -> r -> r
  mul:: r -> r -> r
  zero:: r
  one:: r

--New eval
eval::(SemiRing r) => (v -> r) -> SR v -> r
eval f = e
  where
    e (Add x y) = add (e x) (e y)
    e (Mul x y) = mul (e x) (e y)
    e Zero      = zero
    e One       = one
    e (Var v)   = f v

instance SemiRing Integer where
  add = (+)
  mul = (*)
  zero = 0
  one = 1

instance SemiRing Bool where
  add = (||)
  mul = (&&)
  zero = False
  one = True



    
