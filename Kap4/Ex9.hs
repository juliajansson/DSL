--i. define a type class Ring that corresponds to the ring signature.
class Ring t where
  zero:: t             --Identity elem. resp. to addition
  add:: t -> t -> t    --Adds two elements in ring, result also in ring
  neg:: t -> t      --Negates element in ring, result in ring
  one:: t              --Id. resp. to multiplication
  mul:: t -> t -> t    --Multiplies two elems. in ring, res. in ring



--ii. Define a datatype for the language of ring expressions (including variables), and define a Ring instance for it.

data R v = Zero
         | Add (R v) (R v)
         | Neg (R v)
         | One
         | Mul (R v) (R v)
         | Var v
         deriving Show

--The standard integer instance
instance Ring Integer where
  zero = 0
  add = (+)
  neg = negate
  one = 1
  mul = (*)



--iii. Find two other instances of the Ring class.
--The Boolean ring
instance Ring Bool where
  zero = False
  add = xor
  neg = not
  one = True
  mul = (&&)

xor:: Bool -> Bool -> Bool
xor False _ = False
xor True p  = p

--A variable transformation function to use when evaluation
bf:: Integer -> Bool
bf 0 = False
bf 1 = True

--The modulo ring

newtype Intmod = I Integer
  deriving Show

instance Ring Intmod where
  zero = I 0
  add  = addmod
  neg  = negmod
  one  = I 1
  mul  = mulmod

addmod:: Intmod -> Intmod -> Intmod
addmod (I a) (I b) = I ((a + b) `mod` 5)

negmod:: Intmod -> Intmod
negmod (I a) = I ((negate a) `mod` 5)

mulmod:: Intmod -> Intmod -> Intmod
mulmod (I a) (I b) = I ((a * b) `mod` 5)

--A variable transformation function to use with eval
mf:: Integer -> Intmod
mf a = I (a `mod` 5)



--iv. Define a general evaluator for Ring expressions on the basis of a given assignment function.
eval:: Ring t => (v -> t) -> R v -> t
eval f = e
  where e Zero      = zero
        e (Add a b) = add (e a) (e b)
        e (Neg a)   = neg (e a)
        e One       = one
        e (Mul a b) = mul (e a) (e b)
        e (Var x)   = f x
        

