

-- 1. Get left
lefts' :: [Either a b] -> [a]
lefts' eitherList = foldr (go) [] eitherList
  where
    go (Left left) silo = left:silo
    go _           silo = silo


-- 2. Get right
rights' :: [Either a b] -> [b]
rights' eitherList = foldr (go) [] eitherList
  where
    go (Right right) silo = right:silo
    go _             silo = silo


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


-- 5. General catamorphism for Either values
either' :: (a -> c) -> (b -> c) -> Either a b -> c
either' fac _ (Left a) = fac a
either' _ fbc (Right b) = fbc b
