module Chipher where

import Data.Char

cipherCaesar :: String -> Int -> String
cipherCaesar str n = map (\x -> chr ((mod (ord x + n - 97) 26) + 97)) str

unChipherCaesar :: String -> Int -> String
unChipherCaesar str n = map (\x -> chr ((mod (ord x - n - 97) 26) + 97)) str

-- Works for mixed capitalized, small letters and spaces, produces capitalized text with spaces as '@'.
cipherVigenere :: String -> String -> String
cipherVigenere text key = zipWith (\ t k -> chr ((mod ((ord t) - (ord k)) 32)+64)) text (cycle key)

unCipherVigenere :: String -> String -> String
unCipherVigenere text key = zipWith (\ t k -> chr ((mod ((ord t) + (ord k)) 32)+64)) text (cycle key)