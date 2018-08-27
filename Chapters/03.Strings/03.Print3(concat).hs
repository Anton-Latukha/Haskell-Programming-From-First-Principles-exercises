module Print3 where

greeting :: String
greeting = "Hello " ++ "world!"

hello :: String
hello = "Hello"

world :: String
world = "world!"

main :: IO ()
main = do
    putStrLn greeting
    putStrLn secondGreeting where
        secondGreeting = concat [hello, " ", world]
