import Data.List

data BinaryTree a =
    Leaf
    | Node (BinaryTree a) a (BinaryTree a)
                  deriving (Eq, Ord, Show)

testTree :: BinaryTree Integer
testTree =
  Node (Node Leaf 1 Leaf)
  2
  (Node Leaf 3 Leaf)

foldTree :: (a -> b -> b)
  -> b
  -> BinaryTree a
  -> b

foldTree f result Leaf = result
foldTree f result (Node left a right) = (foldTree (foldTree f (f a result) right) left)
