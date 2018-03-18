squishAgain :: [[a]] -> [a]
squishAgain listLists = squishMap (\x -> x) listLists

squishMap :: (a -> [b]) -> [a] -> [b]
squishMap func list
    | length list == 0 = []
    | True = concat (fmap func list)
