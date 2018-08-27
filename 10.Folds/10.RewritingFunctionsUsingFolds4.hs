myReverse :: [a] -> [a]
myReverse list = foldr (\ a -> (flip (++) [a])) [] list
