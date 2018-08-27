myReverse :: [a] -> [a]
myReverse list = go list []
    where go list result
            | length list == 0 = result
            | True = go (init list) (result++[last list])
