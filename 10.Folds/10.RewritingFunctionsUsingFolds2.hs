myAny :: (a -> Bool) -> [a] -> Bool
myAny f list = foldr (\ a b -> f a || b) False list
