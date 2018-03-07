tensDigit :: Integral a => a -> a
tensDigit x = snd (flip divMod 10 (fst (flip divMod 100 (abs x))))
-- divMod must be piped into itself to make mod.div
-- div always rounds down to infinity, so abs for negative values working properly.
