import Data.List

young :: Ord a => [a] -> a
young xs = head (sort xs)
