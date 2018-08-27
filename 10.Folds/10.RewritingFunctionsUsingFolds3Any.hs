myElem :: Eq a => a -> [a] -> Bool
myElem e list = any (== e) list
