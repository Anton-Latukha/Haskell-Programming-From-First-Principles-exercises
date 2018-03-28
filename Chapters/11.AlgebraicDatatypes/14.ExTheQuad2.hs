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
