seekritFunc :: String -> Double
seekritFunc x =
    (fromIntegral (sum (map length (words x))))/
        (fromIntegral (length (words x)))
