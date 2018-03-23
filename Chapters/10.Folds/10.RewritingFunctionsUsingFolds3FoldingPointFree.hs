myElem :: Eq a => a -> [a] -> Bool
myElem = flip foldr False . ((||).).(==)
