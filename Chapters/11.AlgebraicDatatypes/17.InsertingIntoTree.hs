data BinaryTree a =
    Leaf
    | Node (BinaryTree a) a (BinaryTree a)
                  deriving (Eq, Ord, Show)

insert' :: Ord a
        => a
        -> BinaryTree a
        -> BinaryTree a

insert' b Leaf = Node Leaf b Leaf
insert' b (Node left a right)
  | b == a = Nde left a right
  | b < a = Node (insert' left) a right
  | b > a = Node left a (insert' b right)

tree = (insert' 5 (insert' 3 (insert' 0 Leaf)))
