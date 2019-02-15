type Poly = [Integer]

mulP:: Poly -> Poly -> Poly
mulP [] p            = []
mulP p []            = []
mulP [a] p           = map (a*) p        --Mult all coeffs. with the constant
mulP p [b]           = map (b*) p        --Same here
mulP (0:as) p        = [0] ++ mulP as p  --Coeffs. start with zero + recursive
mulP p (0:bs)        = [0] ++ mulP p bs  --Same here
mulP (a:as) q@(b:bs) = (mulP [a] q) `addP` (mulP (0:as) q)
--First we multiply the constant zero degree coefficient with q, then by polynomial addition we add the recursively multiplied coeffs.

--Polynomial addition
addP:: Poly -> Poly -> Poly
addP [] [] = []
addP [] l  = l
addP l []  = l
addP [a] (b:bs) = [a+b] ++ bs
addP (a:as) [b] = [a+b] ++ as
addP (a:as) (b:bs) = [a+b] ++ (addP as bs) --Recursively adds rest of lists
