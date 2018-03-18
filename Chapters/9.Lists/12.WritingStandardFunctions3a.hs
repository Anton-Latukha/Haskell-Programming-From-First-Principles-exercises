--recursive one
myElem :: Eq a => a -> [a] -> Bool
myElem elem list
    | length list == 0 = False
    | head list == elem = True
    | True = myElem elem (tail list)
