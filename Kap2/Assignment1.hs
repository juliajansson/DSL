--Part 1
data SET a = Empty
           | Singleton a
           | Union (SET a) (SET a)
           | Intersection (SET a) (SET a)
           | Powerset (SET a)
           | Var a

--From Chapter 2
data PRED = Elem
          | Subset
          | And
          | Or
          | Implies
          | Not
