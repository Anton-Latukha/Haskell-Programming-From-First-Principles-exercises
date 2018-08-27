ifEvenAdd2 :: Integral a => a -> a
ifEvenAdd2 n =
    case (even n) of
         True -> n + 2
         False -> n
