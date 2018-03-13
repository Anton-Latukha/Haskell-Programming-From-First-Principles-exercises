hundredsDigit :: Integral a => a -> a
hundredsDigit = snd.flip divMod 10 . fst.flip divMod 100 . abs
-- Fully pointfree version, for gymnastics
-- divMod must be piped into itself to make mod.div
-- div always rounds down to infinity, so abs for negative values working properly.
