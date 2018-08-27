
data BinaryTree a =
    Leaf
  | Node (BinaryTree a) a (BinaryTree a)
  deriving (Eq, Ord, Show)

unfold :: (a -> Maybe (a,b,a)) -> a -> BinaryTree b
unfold f a = go (f a)
  where
    go (Just (a1,b,a2)) = Node (unfold f a1) b (unfold f a2)
    go Nothing = Leaf
