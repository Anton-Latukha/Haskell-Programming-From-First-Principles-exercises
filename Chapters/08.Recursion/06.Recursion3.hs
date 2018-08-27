rMult :: Integral a => a -> a -> a
rMult x 0 = 0
rMult x y = x + rMult x (y - 1)
