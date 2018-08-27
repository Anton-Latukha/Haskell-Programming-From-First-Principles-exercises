--using 'any'
myElem :: (Foldable t, Eq a) => a -> t a -> Bool
myElem elem fold = any (== elem) fold
