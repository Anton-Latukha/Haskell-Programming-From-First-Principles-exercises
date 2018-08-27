go :: (Ord a, Enum a) => a -> a -> [a] -> [a]
go c u a
    | c == u = (a++[c])
    | c > u = []
    | True = go (succ c) u (a++[c])


eftBool :: Bool -> Bool -> [Bool]
eftBool b u = go b u []

            
eftOrd :: Ordering -> Ordering -> [Ordering]
eftOrd o u = go o u []


eftInt :: Int -> Int -> [Int]
eftInt i u = go i u []


eftChar :: Char -> Char -> [Char]
eftChar c u = go c u []
