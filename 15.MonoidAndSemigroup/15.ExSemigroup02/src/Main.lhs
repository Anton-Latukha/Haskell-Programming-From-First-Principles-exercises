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

newtype Identity a = Identity a
  deriving (Eq, Show)

instance Semigroup a ⇒ Semigroup (Identity a) where
  (Identity a) <> (Identity b) = Identity (a <> b)

instance Arbitrary a ⇒ Arbitrary (Identity a) where
  arbitrary = do
    a ← arbitrary
    return $ Identity a

type IdentityAssoc a
  = (Identity a → Identity a → Identity a)
  → Identity a
  → Identity a
  → Identity a
  → Bool

main ∷ IO ()
main = do
  quickCheck ((prop_assoc ∷ IdentityAssoc String) (<>))
\end{code}
