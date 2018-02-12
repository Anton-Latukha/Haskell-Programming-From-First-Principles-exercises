data Identity a = Identity a

instance Eq a => (Identity a) where
    (==) (Identity v) (Identity v') = v == v'
