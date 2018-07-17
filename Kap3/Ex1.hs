module Ex1 where

type T = Double
type Q = Double
type V = Double

g:: Double
g = 9.82

m:: Double
m = 75

lagrange::T -> Q -> V -> Double
lagrange t q v = m*v^2/2 + m*g*q

dlagrangedq:: T -> Q -> V -> Double
dlagrangedq t q v = m*g

dlagrangedv:: T -> Q -> V -> Double
dlagrangedv t q v = m*v

expand:: (T -> Q) -> (T -> Q) -> (T -> (T, Q, V))
expand w dw t = (t, w t, dw t)

fst3:: (a, b, c) -> a
fst3 (x, _, _) = x

snd3:: (a, b, c) -> b
snd3 (_, x, _) = x

thd3:: (a, b, c) -> c
thd3 (_, _, x) = x

-------------------------------

w1 = id

dw1 = const 1.0

test1 = expand w1 dw1 2

--TODO: Fel - återgå

--tst1 = dlagrangedv (fst3 (expand w1 dw1 3)) (snd3 (expand w1 dw1 3)) (thd3 (expand w1 dw1 3))

--alsotest1 = dlagrangedq . (expand w1 dw1) == dlagrangedv . (expand w1 dw1)

----------------------------

w2 = sin

dw2 = cos

test2 = expand w2 dw2 1


--------------------------

q0 = 0

w3 = (q0-) . (g*) . (/2) . (^2)

dw3 x = -g*x

test3 = expand w3 dw3 1
