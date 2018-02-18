data Rocks =
    Rocks String deriving (Eq, Show)

data Yeah =
    Yeah Bool deriving (Eq, Show)

data Papu =
    Papu Rocks Yeah deriving (Eq, Show)

phew = Papu (Rocks "chases") (Yeah True)
