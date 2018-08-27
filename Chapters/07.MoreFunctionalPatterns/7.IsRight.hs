isRight :: (Num a, Eq a) => a -> a -> a -> Bool
isRight a b c
    | a^2 + b^2 == c^2 = True
    | True = False
