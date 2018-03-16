import Data.Char

upString :: [Char] -> [Char]
upString str
    | str == [] = []
    | True = map toUpper str
