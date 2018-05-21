

-- 1. Get left
lefts' :: [Either a b] -> [a]
lefts' eitherList = foldr (go) [] eitherList
  where
    go (Left left) silos = left:silos
    go _           silos = silos

