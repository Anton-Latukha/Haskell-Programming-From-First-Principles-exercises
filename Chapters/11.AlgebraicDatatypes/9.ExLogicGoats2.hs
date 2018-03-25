{-# LANGUAGE GeneralizedNewtypeDeriving #-}
{-# LANGUAGE FlexibleInstances #-}


class TooMany a where
    tooMany :: a -> Bool

instance TooMany Int where
    tooMany n = n > 42

newtype Goats =
    Goats Int deriving (Eq, Show, TooMany)

data CountyStringy = TooMany (Int, String) deriving (Eq, Show)
instance TooMany (Int, String) where
    tooMany (int, _) = int > 42

instance TooMany (Int, Int) where
    tooMany (int1, int2) = (int1 + int2) > 42
