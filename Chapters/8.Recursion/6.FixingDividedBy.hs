dividedBy :: Integral a => a -> a -> Maybe (a, a)
dividedBy num denom
    | denom == 0 = Nothing
    | signum (num) == signum (denom) = go num denom 1 0
    | True = go num denom (-1) 0
    where go num denom sign count
            | abs (num) < abs (denom) = Just (count, num)
            | True = go (num - denom*sign) denom sign (count + sign)
