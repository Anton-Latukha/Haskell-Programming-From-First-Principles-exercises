module Reverse where


rvrs :: String -> String
rvrs str = (drop 9 str) ++ (take 4 (drop 5 str)) ++ (take 5 str)


main :: IO()

main = do
    print (rvrs "Curry is awesome")
