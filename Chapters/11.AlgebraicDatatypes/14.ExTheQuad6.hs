import Data.Cardinality

data Quad = One
          | Two
          | Three
          | Four
          deriving (Eq, Show)

-- 1. eQuad :: Either Quad Quad
-- Left side has Left constructor, and right side has Right constructor, so they give different result
e1EQuad = 4 + 4

-- 2. prodQuad :: (Quad, Quad)
e2ProdQuad = 4*4

-- 3. funcQuad :: Quad -> Quad
e3FuncQuad = 4^4

-- 4. prodTBool :: (Bool, Bool, Bool)
e4ProdTBool = 2*2*2

-- 5. gTwo :: Bool -> Bool -> Bool
e5GTwo = 2^(2+2)

-- 6. fTwo :: Bool -> Quad -> Quad
e6fTwo = 2^(4+4)
