myAny :: (a -> Bool) -> [a] -> Bool
myAny rule list
    | length (list) == 0 = False
    | rule (head list) == True = True
    | True = myAny rule (tail list)
