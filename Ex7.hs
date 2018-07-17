--FORALL eps > 0 EXISTS delta > 0 . FORALL x (in the domain of f) . abs(x-c) < delta -> abs(f x - f c) < eps. Then f continuous at c.

type X = Float

--continuous:: Float -> X -> Prop
continuous c X = FORALL eps > 0

--Ball function:
B c r = {x | abs (x-c) < r}
