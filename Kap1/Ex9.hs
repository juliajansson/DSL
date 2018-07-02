f2p:: a -> (b, c) -> (a -> b, a -> c)
f2p a2bc = (a2b, a2c)
   where a2b = fst . a2bc 
         a2c = snd . a2bc

p2f::(a -> b, a -> c) -> (a -> (b, c))
p2f (a2b, a2c) = \x -> (a2b x, a2c x) --Lambda funktion

--Mer allmänt:
--p2f f g = \x -> (f x, g x)

