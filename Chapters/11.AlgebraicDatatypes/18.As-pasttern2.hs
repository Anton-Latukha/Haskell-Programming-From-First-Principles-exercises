import Data.Char

-- V#1 (readable)
capitalizeWords :: String -> [(String, String)]
capitalizeWords string = fmap (makeGdDmTuples) (words string)
  where
    makeGdDmTuples word@(w:ord) = (word,[(toUpper w)]++ord)

-- V#2
capitalizeWords2 :: String -> [(String, String)]
capitalizeWords2 string = fmap (\ word@(w:ord) -> (word,[(toUpper w)]++ord)) (words string)
