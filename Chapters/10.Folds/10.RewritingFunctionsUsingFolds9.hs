squish :: [[a]] -> [a]
squish = foldr (++) []

myMap :: (a -> b) -> [a] -> [b]
myMap f list = foldr (\ a -> ((f a):)) [] list 

squishMap :: (a -> [b]) -> [a] -> [b]
squishMap f list = squish (myMap (f) list)

squishAgain :: [[a]] -> [a]
squishAgain list = squishMap (\a -> [a]) (squish list)
