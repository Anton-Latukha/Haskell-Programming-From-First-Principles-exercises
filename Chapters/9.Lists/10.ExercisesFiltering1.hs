byThree :: Integral a => [a] -> [a]
byThree xs = filter (\x -> rem x 3 == 0) xs
