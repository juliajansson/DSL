module Ex12 where
--They have the same cardinality, n^2 = n*n

isoR:: (Bool -> t) -> (t, t)
isoR f = (f True, f False)

--Hur ska jag göra generellt? Detta bara ett exempel

isoL:: (t, t) -> (Bool -> t)
isoL p = f
    where f True = fst p
          f False = snd p

func:: Bool -> Int
func True = 1
func False = 0

pair:: (Int, Int)
pair = (1,0)

test0:: (t, t) -> (t, t)
test0 = isoR . isoL

test1:: (Bool -> t) -> (Bool -> t)
test1 = isoL . isoR
