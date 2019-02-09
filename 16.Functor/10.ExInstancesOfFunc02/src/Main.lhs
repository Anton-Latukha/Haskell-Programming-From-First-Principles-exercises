\begin{code}
{-# LANGUAGE UnicodeSyntax #-}

module Main where

import Prelude.Unicode

import Test.QuickCheck
import Test.QuickCheck.Function

data Pair a = Pair a a
  deriving (Eq, Show)

instance Functor Pair where
  fmap f (Pair a b) = Pair (f a) (f b)

instance Arbitrary a ⇒ Arbitrary (Pair a) where
  arbitrary = do
    a ← arbitrary
    b ← arbitrary
    return (Pair a b)

\end{code}

Again, Functor law properties written by hand.
\begin{code}

prop_functorId' ∷ (Functor f, Eq (f a)) ⇒ f a → Bool
prop_functorId' a = fmap id (a) ≡ a

prop_functorCompose' ∷ (Eq (f c), Functor f) ⇒ f a → Fun a b → Fun b c → Bool
prop_functorCompose' x (Fun _ f) (Fun _ g) = (fmap (g . f) x) ≡ (fmap g . fmap f $ x)

\end{code}

Here you can also observe generation of functions of `Integer → String` `String → Integer`.
\begin{code}
main = do
  quickCheck (prop_functorId' ∷ Pair String → Bool)
  quickCheck (prop_functorId' ∷ Pair Integer → Bool)
  quickCheck (prop_functorCompose' ∷ Pair String → Fun String String → Fun String String → Bool)
  quickCheck (prop_functorCompose' ∷ Pair String → Fun String Integer → Fun Integer String → Bool)
  quickCheck (prop_functorCompose' ∷ Pair Integer → Fun Integer Integer → Fun Integer Integer → Bool)
  quickCheck (prop_functorCompose' ∷ Pair Integer → Fun Integer String → Fun String Integer → Bool)
\end{code}
