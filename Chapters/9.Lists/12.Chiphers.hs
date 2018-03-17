module Chipher where

import Data.Char

caesar :: String -> Int -> String
caesar str n = map (\x -> chr ((mod (ord x + n - 97) 26) + 97)) str

unCaesar :: String -> Int -> String
unCaesar str n = map (\x -> chr ((mod (ord x - n - 97) 26) + 97)) str
