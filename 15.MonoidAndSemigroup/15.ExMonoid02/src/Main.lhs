\begin{code}
{-# LANGUAGE UnicodeSyntax #-}

module Main where

import Prelude.Unicode

import Test.QuickCheck

newtype Identity a = Identity a
  deriving (Eq, Show)

instance Semigroup a ⇒ Semigroup (Identity a) where
  (Identity a) <> (Identity b) = Identity (a <> b)

instance Monoid a ⇒ Monoid (Identity a) where
  mempty = Identity mempty

instance Arbitrary a ⇒ Arbitrary (Identity a) where
  arbitrary = do
    a ← arbitrary
    return $ Identity a

\end{code}
Versatile general functions definitions that check any binary function
  for associative law and left&right identity.

Using the most versatile definition for reuse in future tasks.
  Abstracting away from particular operations
  (property not bound to particular operation aka mappend).
  And identity (e) can be not only a monoids mempty.
\begin{code}
prop_assoc ∷ (Eq m) ⇒ (m → m → m) → m → m → m → Bool
prop_assoc f a b c = (f a (f b c)) ≡ (f (f a b) c)

prop_leftId ∷ (Monoid a, Eq a) ⇒ (a → a → a) → a → a → Bool
prop_leftId f e a = f e a ≡ a

prop_rightId ∷ (Monoid a, Eq a) ⇒ (a → a → a) → a → a → Bool
prop_rightId f a e = f a e ≡ a

type IdentityAssoc a
  = (Identity a → Identity a → Identity a)
  → Identity a
  → Identity a
  → Identity a
  → Bool

type SideIdentity a
  = (Identity a → Identity a → Identity a)
  → Identity a
  → Identity a
  → Bool

main ∷ IO ()
main = do
  quickCheck ((prop_assoc ∷ IdentityAssoc String) (<>))
  quickCheck ((prop_leftId ∷ SideIdentity String) (<>) mempty)
  quickCheck (flip ((prop_rightId ∷ SideIdentity String) (<>)) mempty )
\end{code}
