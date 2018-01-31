module Print3Flipped where

greeting :: String
greeting = (++) "Hello" " world!"

hello :: String
hello = "hello"

world :: String
world = "world!"

main :: IO()
main = do
    putStrLn greeting
    putStrLn secondGreeting where
        secondGreeting = 
            (++) hello ((++) " " "world")
