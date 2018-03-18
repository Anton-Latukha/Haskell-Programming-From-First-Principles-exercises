myMinimumBy :: (t -> t -> Ordering) -> [t] -> t
myMinimumBy func (x:xs) = go func xs x -- initialisation of result solved by x:xs
    where go func list result
            | length list == 0 = result
            | func result (head list) == LT = go func (tail list) result
            | True = go func (tail list) (head list)
