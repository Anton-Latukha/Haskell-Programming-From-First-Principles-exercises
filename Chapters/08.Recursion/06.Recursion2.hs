rSum :: Integral a => a -> a
rSum 0 = 0
rSum x = x + rSum (x - 1)
