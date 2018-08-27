myMaximumBy :: (a -> a -> Ordering) -> [a] -> a
myMaximumBy f list = foldr1 (\ a b -> if (f a b == GT) then a else b) list
