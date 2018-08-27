import Data.Int

data NumberOrBool =
    Numba Int8 | BoolyBool Bool
    deriving (Eq, Show)

myNumba = Numba (-128)
