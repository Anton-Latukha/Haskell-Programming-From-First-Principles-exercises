myFilter :: (a -> Bool) -> [a] -> [a]
myFilter f list = foldr (\ a b -> if (f a) then (a:b) else b) [] list 
