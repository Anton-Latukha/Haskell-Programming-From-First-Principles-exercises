lengthByThree :: Integral a => [a] -> Int
lengthByThree = length . filter ((0 ==) . flip rem 3)
