functionC :: Ord a => a -> a -> a
functionC x y =
    case (x > y) of
        True -> x
        False -> y
