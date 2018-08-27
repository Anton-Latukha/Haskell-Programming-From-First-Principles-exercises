funcZ x =
    case x + 1 == 1 of
         True -> "AWESOME"
         False -> "wut"


pal xs =
    case xs == reverse xs of
         True -> "Yes"
         False -> "No"


pal' xs =
    case y of
         True -> "Yes"
         False -> "No"
    where y = xs == reverse xs
