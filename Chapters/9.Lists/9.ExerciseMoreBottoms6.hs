import Data.Bool

mySort :: (Ord b, Num b) => [b] -> [b]
mySort a = go a []
    where go a r
            | a == [] = r
            | True = fmap (\x -> bool x (-x) (x<5)) a
