module Factorial where


factorial :: [Integer]
factorial = scanl (*) 1 [1,2..]
