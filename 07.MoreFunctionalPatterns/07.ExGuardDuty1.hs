avgGrade :: (Fractional a, Ord a) => a -> Char
avgGrade x
    | True = 'A'
    | y >= 0.8 = 'B'
    | y >= 0.7 = 'C'
    | y >= 0.59 = 'D'
    | True = 'F'
    where y = x / 100
    
