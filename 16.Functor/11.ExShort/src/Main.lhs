\begin{code}
{-# LANGUAGE UnicodeSyntax #-}

module Main where

import Prelude.Unicode

import Test.QuickCheck
import Test.QuickCheck.Function

data Sum a b
  = First a
  | Second b
  deriving (Eq, Show)

instance Functor (Sum a) where
  fmap _ (First a) = First a
  fmap f (Second b) = Second (f b)

instance (Arbitrary a, Arbitrary b) ⇒ Arbitrary (Sum a b) where
  arbitrary = do
    a ← arbitrary
    b ← arbitrary
    oneof [return (First a), return (Second b)]

prop_functorId' ∷ (Functor f, Eq (f a)) ⇒ f a → Bool
prop_functorId' a = fmap id (a) ≡ a

prop_functorCompose' ∷ (Eq (f c), Functor f) ⇒ f a → Fun a b → Fun b c → Bool
prop_functorCompose' x (Fun _ f) (Fun _ g) = (fmap (g . f) x) ≡ (fmap g . fmap f $ x)

main = do
  quickCheck (prop_functorId' ∷ Sum Bool String → Bool)
  quickCheck (prop_functorId' ∷ Sum Bool Integer → Bool)
  quickCheck (prop_functorCompose' ∷ Sum (Maybe Bool) String → Fun String Integer → Fun Integer String → Bool)
\end{code}
