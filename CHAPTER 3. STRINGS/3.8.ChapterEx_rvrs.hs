module TakeDrop where

initStr = "Curry is awesome"

rvrs str = (drop 9 str) ++ (take 4 (drop 5 str)) ++ (take 5 str)

main :: IO()

main = do
    putStrLn (rvrs initStr)
