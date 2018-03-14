dividedBy :: Integral a => a -> a -> Maybe (a, a)
dividedBy num denom
    | denom == 0 = Nothing
    | signum (num) == signum (denom) = go1 num denom 0
    | True = go2 num denom 0
    where go1 num denom count
            | abs (num) < abs (denom) = Just (count, num)
            | True = go1 (num - denom) denom (count + 1)
          go2 num denom count
            | abs (num) < abs (denom) = Just (count, num)
            | True = go2 (num + denom) denom (count - 1)
