myElem :: Eq a => a -> [a] -> Bool
myElem = any.(==)
