-- 1.
data TisAnInteger = ThisAn Integer
instance Eq TisAnInteger where
    (==) (ThisAn a) (ThisAn a') = a == a'



-- 2.
data TwoIntegers = Two Integer Integer
instance Eq TwoIntegers where
    (==) (Two a1 b1) (Two a2 b2) = a1 == a2 && b1 == b2



-- 3.
data StringOrInt = TisAnInt Int | TisAString String
instance Eq StringOrInt where
    (==) (TisAnInt a1) (TisAnInt a2) = a1 == a2
    (==) (TisAString a1) (TisAString a2) = a1 == a2
    (==) _ _ = False
    


-- 4.
data Pair a = Pair a a
instance Eq a => Eq (Pair a) where
    (==) (Pair a1 a3) (Pair a2 a4) = a1 == a2 && a3 == a4



-- 5.
data Tuple a b = Tuple a b
instance (Eq a, Eq b) => Eq (Tuple a b) where
    (==) (Tuple a1 b1) (Tuple a2 b2) = a1 == a2 && b1 == b2


-- 6.
data Which a = ThisOne a | ThatOne a
instance Eq a => Eq (Which a) where
    (==) (ThisOne a1) (ThisOne a2) = a1 == a2
    (==) (ThatOne a1) (ThatOne a2) = a1 == a2



-- 7.
data EitherOr a b = Hello a | Goodbye b
instance (Eq a, Eq b) => Eq (EitherOr a b) where
    (==) (Hello a1) (Hello a2) = a1 == a2
    (==) (Goodbye b1) (Goodbye b2) = b1 == b2
