import Data.Char

upFirstWord :: [Char] -> [Char]
upFirstWord str
    | str == [] = []
    | True = [toUpper (head str)]++(tail str)
