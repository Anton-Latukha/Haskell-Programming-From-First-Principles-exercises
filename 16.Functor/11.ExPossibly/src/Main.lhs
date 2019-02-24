\begin{code}
{-# LANGUAGE UnicodeSyntax #-}
{-# LANGUAGE GeneralizedNewtypeDeriving #-}

module Main where

import Prelude.Unicode

import Test.QuickCheck

data Possibly a
  = LolNope
  | Yeppers a
  deriving (Eq, Show)

instance Functor Possibly where
  fmap f (Yeppers a) = Yeppers (f a)
  fmap _ LolNope = LolNope

instance Arbitrary a ⇒ Arbitrary (Possibly a) where
  arbitrary = do
    a ← arbitrary
    oneof [return LolNope, return (Yeppers a)]

\end{code}

To be right - testing Functor laws.
\begin{code}

prop_functorId' ∷ (Functor f, Eq (f a)) ⇒ f a → Bool
prop_functorId' a = fmap id (a) ≡ a

prop_functorCompose' ∷ (Eq (f c), Functor f) ⇒ f a → Fun a b → Fun b c → Bool
prop_functorCompose' x (Fun _ f) (Fun _ g) = (fmap (g . f) x) ≡ (fmap g . fmap f $ x)

main = do
  quickCheck (prop_functorId' ∷ Possibly String → Bool)
  quickCheck (prop_functorId' ∷ Possibly Integer → Bool)
  quickCheck (prop_functorCompose' ∷ Possibly String → Fun String Integer → Fun Integer String → Bool)
\end{code}
