module Ex9 where
import Numeric.Natural

--Part a
a::Natural -> Double
a n = fromInteger (toInteger (mod n 2))

--Part b, learn exists and forall
