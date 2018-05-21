

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
