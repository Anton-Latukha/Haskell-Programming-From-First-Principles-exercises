\begin{code}
{-# LANGUAGE UnicodeSyntax #-}

module ModuleName where

import Prelude.Unicode

import Test.QuickCheck

\end{code}
Function that checks any binary function for associative law.
\begin{code}
prop_assoc ∷ (Eq m) ⇒ (m → m → m) → m → m → m → Bool
prop_assoc f a b c = (f a (f b c)) ≡ (f (f a b) c)

data Two a b = Two a b
  deriving (Eq, Show)

instance (Semigroup t1, Semigroup t2) ⇒ Semigroup (Two t1 t2) where
  (<>) (Two a b) (Two c d) = Two (a <> c) (b <> d)

type TwoAssoc a b
  = (Two a b → Two a b → Two a b)
  → Two a b
  → Two a b
  → Two a b
  → Bool

instance (Arbitrary a, Arbitrary b) ⇒ Arbitrary (Two a b) where
  arbitrary = do
    a ← arbitrary
    b ← arbitrary
    return $ Two a b

main ∷ IO ()
main = do
  quickCheck ((prop_assoc ∷ TwoAssoc String String) (<>))
\end{code}
