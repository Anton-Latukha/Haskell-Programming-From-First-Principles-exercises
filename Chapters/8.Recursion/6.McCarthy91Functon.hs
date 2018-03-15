mc91 :: Integral a => a -> a
mc91 n
    | n > 100 = n - 10
    | True = mc91 (mc91 (n + 11))
