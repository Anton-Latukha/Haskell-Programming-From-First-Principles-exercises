fibonacci :: [Integer]
fibonacci = 1 : scanl (+) 1 fibonacci

fibNum20 = take 20 fibonacci
