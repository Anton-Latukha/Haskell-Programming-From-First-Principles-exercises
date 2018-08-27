myOr :: [Bool] -> Bool
myOr list
    | length (list) == 0 = False
    | head list == True = True
    | True = myOr (tail list)
