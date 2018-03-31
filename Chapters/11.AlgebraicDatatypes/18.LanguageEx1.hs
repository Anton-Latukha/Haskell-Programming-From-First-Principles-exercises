-- The trick is by requirement we need not match by substring or chars, but presence of chars in the list in the order, 'h' before 'b','l','a' would not match.
import Data.Char

capitalizeWord :: String -> String
capitalizeWord [] = []
capitalizeWord (w:rd) = [(toUpper w)]++rd
