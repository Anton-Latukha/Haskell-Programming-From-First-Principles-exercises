module ExStrings where

string :: String
string = "Curry is awesome"

func_a :: String -> String
func_a x = x ++ "!"

func_b :: String -> Char
func_b x = x !! 4

func_c :: String -> String
func_c x = drop 9 (func_a x)

string_a :: String
string_a = func_a string

char_b :: Char
char_b = func_b string

string_c :: String
string_c = func_c string


main :: IO()
main = do
    putStrLn string_a
    putChar char_b
    putStrLn string_c
