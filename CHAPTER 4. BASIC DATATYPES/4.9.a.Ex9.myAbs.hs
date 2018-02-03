module MyAbs where

myAbs2 :: Integer -> Integer
myAbs2 x
    | x >= 0 = x
    | otherwise = (-x)
