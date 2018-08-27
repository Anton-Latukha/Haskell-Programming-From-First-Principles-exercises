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
foldTree f result (Node left a right) = (foldTree f (foldTree f (f a result) right) left)

--- Ver #2
treeToList :: BinaryTree a -> [a]
treeToList Leaf = []
treeToList (Node left a right) = ((treeToList left) ++ [a] ++ (treeToList right)) -- yep.

foldTree2 :: (a -> b -> b) -> b -> BinaryTree a -> b
foldTree2 f result Leaf = result
foldTree2 f result tree = foldr f result (treeToList tree)
