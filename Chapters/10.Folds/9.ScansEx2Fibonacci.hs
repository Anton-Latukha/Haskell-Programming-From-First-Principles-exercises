fibonacci :: [Integer]
fibonacci = 1 : scanl (+) 1 fibonacci

fibLess100 = takeWhile ( < 100) fibonacci 
