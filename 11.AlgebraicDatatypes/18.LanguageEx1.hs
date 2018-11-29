module Language where

import Data.Char

capitalizeWord :: String -> String
capitalizeWord [] = []
capitalizeWord (w:rd) = [(toUpper w)]++rd
