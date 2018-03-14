
dividedBy :: Integral a => a -> a -> Maybe (a, a)
dividedBy num denom
    | denom == 0 = Nothing
    | True = go num denom 0
    where go num denom count
            | abs (num) < abs (denom) = Just (count, num)
            | signum (num) == signum (denom) = go (num - denom) denom (count + 1)
            | True = go (num + denom) denom (count - 1)
