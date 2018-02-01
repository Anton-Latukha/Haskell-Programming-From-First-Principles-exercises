module ExStrings where

string :: String
string = "Curry is awesome"

thirdLetter :: String -> Char
thirdLetter x = x !! 2


main :: IO()
main = do
    putChar (thirdLetter string)
    putChar '\n'
