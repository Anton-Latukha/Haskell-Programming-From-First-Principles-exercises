-- The trick is by requirement we need not match by substring or chars, but presence of chars in the list in the order, 'h' before 'b','l','a' would not match.
import Data.Char
import Data.List

-- V#1 (readable)
capitalizeWords :: String -> [(String, String)]
capitalizeWords string = fmap (makeGdDmTuples) (words string)
  where
    makeGdDmTuples word@(w:ord) = (word,[(toUpper w)]++ord)

-- V#2
capitalizeWords2 :: String -> [(String, String)]
capitalizeWords2 string = fmap (\ word@(w:ord) -> (word,[(toUpper w)]++ord)) (words string)
