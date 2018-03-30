import Data.List

data BinaryTree a =
    Leaf
    | Node (BinaryTree a) a (BinaryTree a)
                  deriving (Eq, Ord, Show)

treeToList :: BinaryTree a -> [a]
treeToList Leaf = []
treeToList (Node left a right) = ((treeToList left) ++ [a] ++ (treeToList right)) -- yep.

testTree :: BinaryTree Integer
testTree =
  Node (Node Leaf 1 Leaf)
  2
  (Node Leaf 3 Leaf)

testPreorder :: IO ()
testPreorder =
  if treeToList testTree == [1, 2, 3]  -- If binary tree is holistic, a binary search, algorythm returns sorted list.
  then putStrLn "Preorder fine!"
  else putStrLn "Bad news bears."

testInorder :: IO ()
testInorder =
  if sort (treeToList testTree) == [1, 2, 3] -- If binary tree is not sorted - sort the list.
  then putStrLn "Inorder fine!"
  else putStrLn "Bad news bears."
