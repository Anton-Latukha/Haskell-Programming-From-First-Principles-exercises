module ExStrings where

x = "Curry is awesome"

a x = x ++ "!"
b x = x !! 4
c x = drop 9 (a x)
