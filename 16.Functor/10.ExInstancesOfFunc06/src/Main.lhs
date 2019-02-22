\begin{code}
{-# LANGUAGE UnicodeSyntax #-}

module Main where

import Prelude.Unicode

import Test.QuickCheck
import Test.QuickCheck.Function

data Four a b c d = Four a b c d
  deriving (Eq, Show)

instance Functor (Four a b c) where
  fmap f (Four a b c d) = Four a b c (f d)

instance (Arbitrary a, Arbitrary b, Arbitrary c, Arbitrary d) ⇒ Arbitrary (Four a b c d) where
  arbitrary = do
    a ← arbitrary
    b ← arbitrary
    c ← arbitrary
    d ← arbitrary
    return (Four a b c d)

prop_functorId' ∷ (Functor f, Eq (f a)) ⇒ f a → Bool
prop_functorId' a = fmap id (a) ≡ a

prop_functorCompose' ∷ (Eq (f c), Functor f) ⇒ f a → Fun a b → Fun b c → Bool
prop_functorCompose' x (Fun _ f) (Fun _ g) = (fmap (g . f) x) ≡ (fmap g . fmap f $ x)

main = do
  quickCheck (prop_functorId' ∷ Four (Maybe String) [Bool] Char String → Bool)
  quickCheck (prop_functorId' ∷ Four (Maybe String) [Bool] Char Integer → Bool)
  quickCheck (prop_functorCompose' ∷ Four (Maybe String) [Bool] Char String → Fun String Integer → Fun Integer String → Bool)
\end{code}
