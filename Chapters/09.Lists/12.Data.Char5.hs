import Data.Char

uppedFirstChar :: [Char] -> Char
uppedFirstChar str
    | str == [] = '\0'
    | True = toUpper (head str)
