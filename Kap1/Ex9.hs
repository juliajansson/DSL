module Ex9 where

f2p:: (a -> (b, c)) -> (a -> b, a -> c)
f2p a2bc = (a2b, a2c)
   where a2b = fst . a2bc 
         a2c = snd . a2bc

p2f::(a -> b, a -> c) -> (a -> (b, c))
p2f (a2b, a2c) = \x -> (a2b x, a2c x) --Lambda funktion

--Mer allmänt:
--p2f f g = \x -> (f x, g x)

f:: Int -> (Int, String)
f x = (x + 1, show x)

test0:: Int
test0 = fst (f2p f) 1000

test1:: String
test1 = snd (f2p f) 1000

p:: (Int -> Int, Int -> String)
p = (intf, stringf)
     where intf x = x + 1
           stringf x = show x

test2:: (Int, String)
test2 = p2f p 5

--Verkar funka bra!


