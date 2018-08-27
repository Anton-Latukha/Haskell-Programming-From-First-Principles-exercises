myAny :: (a -> Bool) -> [a] -> Bool
myAny = flip foldr False . ((||).)
