myZip :: [a] -> [b] -> [(a, b)]
myZip a b = go a b []
    where go a b r
            | min (length a) (length b) == 0 = r
            | True = go (tail a) (tail b) (r++[(head a, head b)])
