s2p:: (Either b c -> a) -> (b -> a, c -> a)
s2p eitherbc2a = (f, g)
     where f b = eitherbc2a (Left b)
           g c = eitherbc2a (Right c)

p2s:: (b -> a, c -> a) -> (Either b c -> a)
p2s (b2a, c2a) = eitherbc2a
     where eitherbc2a (Left b) = b2a b
           eitherbc2a (Right c) = c2a c
--Test
