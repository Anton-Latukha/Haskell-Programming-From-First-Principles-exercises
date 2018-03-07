tensDigit :: Integral a => a -> a
tensDigit x = snd (divMod (fst (divMod (abs x) 10)) 10)
-- divMod must be piped into itself to make mod.div
-- div always rounds down to infinity, so abs for negative values working properly.
