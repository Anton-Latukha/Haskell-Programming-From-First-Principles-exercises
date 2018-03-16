import Data.Char

strOfUpper :: [Char] -> [Char]
strOfUpper str = [x | x <- str, isUpper x]
