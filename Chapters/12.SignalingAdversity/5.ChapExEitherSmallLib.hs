

-- 1. Get left
lefts' :: [Either a b] -> [a]
lefts' eitherList = foldr (go) [] eitherList
  where
    go (Left left) silos = left:silos
    go _           silos = silos


-- 2. Get right
rights' :: [Either a b] -> [b]
rights' eitherList = foldr (go) [] eitherList
  where
    go (Right right) silos = right:silos
    go _             silos = silos


-- 3. Sort lefts and rights to separate lists
partitionEithers' :: [Either a b]
                  -> ([a], [b])
partitionEithers' eitherList = foldr (go) ([],[]) eitherList
  where
    go (Left left)   (l, r) = ((left:l),r)
    go (Right right) (l, r) = (l,(right:r))


-- 4. Just Right, Nothing Left
eitherMaybe' :: (b -> c) -> Either a b -> Maybe c
eitherMaybe' f (Right b) = Just (f b)
eitherMaybe' _ _ = Nothing
