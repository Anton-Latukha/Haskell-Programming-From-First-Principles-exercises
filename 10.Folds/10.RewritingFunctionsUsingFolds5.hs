myMap :: (a -> b) -> [a] -> [b]
myMap f list = foldr (\ a -> ((f a):)) [] list 
