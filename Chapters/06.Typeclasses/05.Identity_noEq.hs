data Identity a = Identity a

instance (Identity a) where
    (==) (Identity v) (Identity v') = v == v'
