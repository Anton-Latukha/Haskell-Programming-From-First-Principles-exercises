myMinimumBy:: (a -> a -> Ordering) -> [a] -> a
myMinimumBy f list = foldr1 (\ a b -> if (f a b == LT) then a else b) list
