module WordNumber where

import Data.List (intersperse)

digitToWord :: Int -> String
digitToWord n
    | n == 0 = "zero"
    | n == 1 = "one"
    | n == 2 = "two"
    | n == 3 = "three"
    | n == 4 = "four"
    | n == 5 = "five"
    | n == 6 = "six"
    | n == 7 = "seven"
    | n == 8 = "eight"
    | n == 9 = "nine"
    | True = "-"

digits :: Int -> [Int]
digits n = map (\x -> read [x] :: Int) (show n)

wordNumber :: Int -> String
wordNumber = concat.map digitToWord.(intersperse 10).digits
