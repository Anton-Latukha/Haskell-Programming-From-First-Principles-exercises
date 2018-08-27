data Rocks =
    Rocks String deriving (Eq, Ord, Show)

data Yeah =
    Yeah Bool deriving (Eq, Ord, Show)

data Papu =
    Papu Rocks Yeah deriving (Eq, Ord, Show)

comparePapus :: Papu -> Papu -> Bool
comparePapus p p' = p > p'
