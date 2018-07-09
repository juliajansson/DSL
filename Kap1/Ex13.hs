module Ex13 where
import Numeric.Natural
import Data.Ratio

type Seq a = Natural -> a
--What does function composition do to a sequence?

--Composition on the left applies a function on every sequence value
--For example:

s0:: Seq (Ratio Natural)
s0 i = 1%(1+i) 

s1:: Seq (Ratio Natural)
s1 = f . s0

f:: Num a => a -> a
f = (^2)

--Composition on the right applies a function on every natural number before it is input to the sequence
--For example

s2:: Seq (Ratio Natural)
s2 = s0 . f

test1:: Ratio Natural
test1 = s1 3

test2:: Ratio Natural
test2 = s2 3




--How is liftSeq1 related to fmap?

--fmap:: (a -> b) -> f a -> f b 

liftSeq1:: (a -> b) -> Seq a -> Seq b
liftSeq1 h f i = h (f i)

--fmap är liknande fast med funktioner istället för sekvenser

myLiftSeq1:: (a -> b) -> Seq a -> Seq b
myLiftSeq1 = fmap

--How is liftSeq0 related to conSeq?
conSeq:: Eq a => a -> Seq a
conSeq c i = c

liftSeq0:: Eq a => a -> Seq a
liftSeq0 c i = c

test:: Eq a => a -> Natural -> Bool
test x n = conSeq x n == liftSeq0 x n

--They are equal
