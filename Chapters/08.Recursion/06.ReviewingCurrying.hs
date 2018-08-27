 cattyConny :: String -> String -> String
 cattyConny x y = x ++ " conny " ++ y
 
 flippy :: String -> String -> String
 flippy = flip cattyConny
 
 appedCatty :: String -> String
 appedCatty = cattyConny "apped"
 
 frappe :: String -> String
 frappe = flippy "frappe"
