foldBool :: a -> a -> Bool -> a
foldBool x y b =
    case b of
        True -> y
        _ -> x
