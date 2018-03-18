squishMap :: (a -> [b]) -> [a] -> [b]
squishMap func list
    | length list == 0 = []
    | True = squish (fmap func list)

squish :: [[a]] -> [a]
squish listLists = go listLists []
    where go listLists result
            | length listLists == 0 = result
            | True = go (tail listLists) (result++head listLists)
