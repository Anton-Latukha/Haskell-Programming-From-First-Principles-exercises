\begin{code}
{-# LANGUAGE UnicodeSyntax #-}

module Main where

import Prelude.Unicode

import Test.QuickCheck

data Two a b = Two a b
  deriving (Eq, Show)

instance (Semigroup t1, Semigroup t2) ⇒ Semigroup (Two t1 t2) where
  (<>) (Two a b) (Two c d) = Two (a <> c) (b <> d)

instance (Monoid t1, Monoid t2) ⇒ Monoid (Two t1 t2) where
  mempty = Two mempty mempty

instance (Arbitrary a, Arbitrary b) ⇒ Arbitrary (Two a b) where
  arbitrary = do
    a ← arbitrary
    b ← arbitrary
    return $ Two a b

\end{code}
Versatile general functions definitions that check any binary function
  for associative law and left&right identity.
  Good for code reuse.
\begin{code}

prop_assoc ∷ (Eq m) ⇒ (m → m → m) → m → m → m → Bool
prop_assoc f a b c = (f a (f b c)) ≡ (f (f a b) c)

prop_leftId ∷ (Monoid a, Eq a) ⇒ (a → a → a) → a → a → Bool
prop_leftId f e a = f e a ≡ a

prop_rightId ∷ (Monoid a, Eq a) ⇒ (a → a → a) → a → a → Bool
prop_rightId f a e = f a e ≡ a

type TwoAssoc a b
  = (Two a b → Two a b → Two a b)
  → Two a b
  → Two a b
  → Two a b
  → Bool

type TwoSideId a b
  = (Two a b → Two a b → Two a b)
  → Two a b
  → Two a b
  → Bool


main ∷ IO ()
main = do
  quickCheck ((prop_assoc ∷ TwoAssoc String String) (<>))
  quickCheck ((prop_leftId ∷ TwoSideId String String) (<>) mempty)
  quickCheck (flip ((prop_rightId ∷ TwoSideId String String) (<>)) mempty )

\end{code}
