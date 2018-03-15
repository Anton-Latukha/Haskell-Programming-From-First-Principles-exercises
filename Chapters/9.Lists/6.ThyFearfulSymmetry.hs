myWords :: [Char] -> [[Char]]
myWords s = filter (not.null) (go s [[]])
    where
        go :: [Char] -> [[Char]] -> [[Char]]
        go s r
            -- When end of the list gets passed
            | s == [] = r
            -- Send the on input send a string that removes current word; then save the current word in list
            | True = go (dropWhile (==' ') (dropWhile (/=' ') s)) (r++[(takeWhile (/=' ') s)])
