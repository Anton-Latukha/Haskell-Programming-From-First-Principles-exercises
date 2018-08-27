bloodNa :: Integer -> String
bloodNa x
    | x < 135 = "Too low."
    | x > 145 = "Too High."
    | True    = "Normal."
