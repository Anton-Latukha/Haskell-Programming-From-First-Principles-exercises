\begin{code}
{-# LANGUAGE UnicodeSyntax #-}

module Main where

import Prelude.Unicode

import Test.QuickCheck
import Test.QuickCheck.Function

data Three' a b = Three' a b b
  deriving (Eq, Show)

instance Functor (Three' a) where
  fmap f (Three' a b c) = Three' a (f b) (f c)

instance (Arbitrary a, Arbitrary b) ⇒ Arbitrary (Three' a b) where
  arbitrary = do
    a ← arbitrary
    b ← arbitrary
    c ← arbitrary
    return (Three' a b c)

prop_functorId' ∷ (Functor f, Eq (f a)) ⇒ f a → Bool
prop_functorId' a = fmap id (a) ≡ a

prop_functorCompose' ∷ (Eq (f c), Functor f) ⇒ f a → Fun a b → Fun b c → Bool
prop_functorCompose' x (Fun _ f) (Fun _ g) = (fmap (g . f) x) ≡ (fmap g . fmap f $ x)

main = do
  quickCheck (prop_functorId' ∷ Three' (Maybe String) String → Bool)
  quickCheck (prop_functorId' ∷ Three' (Maybe String) Integer → Bool)
  quickCheck (prop_functorCompose' ∷ Three' (Maybe String) String → Fun String Integer → Fun Integer String → Bool)
\end{code}
