myMinimum :: Ord a => [a] -> a
myMinimum list = myMinimumBy compare list

myMaximum :: Ord a => [a] -> a
myMaximum list = myMaximumBy compare list

myMinimumBy :: (t -> t -> Ordering) -> [t] -> t
myMinimumBy func list = myOrdBy func list LT

myMaximumBy :: (t -> t -> Ordering) -> [t] -> t
myMaximumBy func list = myOrdBy func list GT

myOrdBy :: (t -> t -> Ordering) -> [t] -> Ordering -> t
myOrdBy func (x:xs) o = go func xs x o -- initialisation of result solved by x:xs
    where go func list result o
            | length list == 0 = result
            | func result (head list) == o = go func (tail list) result o
            | True = go func (tail list) (head list) o
