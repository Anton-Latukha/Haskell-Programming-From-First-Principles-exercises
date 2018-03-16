myZipWith :: (a -> b -> c) -> [a] -> [b] -> [c]
myZipWith action xs ys = go action xs ys []
    where go action xs ys r
            | min (length xs) (length ys) == 0 = r
            | True = go action (tail xs) (tail ys) (r++[action (head xs) (head ys)])
