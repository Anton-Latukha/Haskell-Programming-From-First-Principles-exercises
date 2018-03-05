dogYrs :: Integer -> Integer
dogYrs x
    | x <= 0    = 0
    | x <= 1    = x * 15
    | x <= 2    = x * 12
    | x <= 4    = x * 15
    | True      = x * 6
