myOr :: [Bool] -> Bool
myOr = foldr (||) False
