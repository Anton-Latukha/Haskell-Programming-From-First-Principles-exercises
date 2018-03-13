hundredsDigit :: Integral a => a -> a
hundredsDigit x = snd (divMod (fst (divMod (abs x) 100)) 10)
-- divMod must be piped into itself to make mod.div
-- div always rounds down to infinity, so abs for negative values working properly.
