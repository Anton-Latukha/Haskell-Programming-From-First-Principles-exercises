pal :: (Eq x) => [x] -> Bool
pal xs
    | xs == reverse xs = True
    | True = False
