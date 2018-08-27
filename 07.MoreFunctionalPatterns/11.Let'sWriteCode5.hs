module Arith4 where

-- id :: a -> a
-- id x = x

roundTrip :: (Show a) => a -> Float
roundTrip x = read (show x) :: Float


main = do
    print (roundTrip (4 :: Float))
    print $ id (4 :: Float)
