nums x =
    case compare x 0 of
         LT -> -1
         GT -> 1
         EQ -> 0
