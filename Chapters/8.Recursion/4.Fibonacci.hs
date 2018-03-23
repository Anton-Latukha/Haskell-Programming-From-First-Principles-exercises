module Fibonacci where


fibonacci :: (Eq a, Num a, Num t) => a -> t
fibonacci 0 = 0
fibonacci 1 = 1
fibonacci n = fibonacci (n - 2) + fibonacci (n - 1)
