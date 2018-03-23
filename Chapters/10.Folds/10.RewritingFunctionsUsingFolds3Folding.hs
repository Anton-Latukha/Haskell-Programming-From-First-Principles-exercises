myElem :: Eq a => a -> [a] -> Bool
myElem e list = foldr (\ a b -> (a == e) || b) False list
