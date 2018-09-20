data Optional a =
    Nada
  | Only a
  deriving (Eq, Show)

instance Monoid a => Monoid (Optional a) where
  mempty  :: Optional a
  mempty = Nada
  mappend :: Optional a -> Optional a -> Optional a
  mappend (Only x) (Only y) = Only $ mappend x y
  mappend (Only x) _        = Only x
  mappend _        (Only y) = Only y
  mappend _        _        = Nada
  mconcat :: [Optional a] -> Optional a
  mconcat =  foldr mappend mempty

{-
class Monoid m where
mempty  :: m
mappend :: m -> m -> m
mconcat :: [m] -> m
mconcat =  foldr mappend mempty

Prelude> Only (Sum 1) `mappend` Only (Sum 1)
Only (Sum {getSum = 2})
Prelude> Only (Product 4) `mappend` Only (Product 2)
Only (Product {getProduct = 8})
Prelude> Only (Sum 1) `mappend` Nada
Only (Sum {getSum = 1})
Prelude> Only [1] `mappend` Nada
Only [1]
Prelude> Nada `mappend` Only (Sum 1)
Only (Sum {getSum = 1})
-}
