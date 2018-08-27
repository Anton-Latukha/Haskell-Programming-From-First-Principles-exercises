seekritFunc x =
    div (sum (map length (words x)))
        (length (words x))

-- calculates avarage length of a word in text with integral division
seekritFunc :: String -> Int
