myMaximumBy :: (t -> t -> Ordering) -> [t] -> t
myMaximumBy func (x:xs) = go func xs x -- initialisation of result solved by x:xs
    where go func list result
            | length list == 0 = result
            | func result (head list) == GT = go func (tail list) result
            | True = go func (tail list) (head list)
