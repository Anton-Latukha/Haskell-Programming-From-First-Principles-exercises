\begin{code}
{-# LANGUAGE UnicodeSyntax #-}
{-# LANGUAGE InstanceSigs #-}
\end{code}

Since Applicative requires Funtor - reusing the code from the Functor chapter.
\begin{code}
module Main where

import Prelude.Unicode

import Test.QuickCheck
import Test.QuickCheck.Classes
import Test.QuickCheck.Checkers

data Pair a = Pair a a
  deriving (Eq, Show)

instance Functor Pair where
  fmap f (Pair a b) = Pair (f a) (f b)

instance Applicative Pair where
  pure ∷ a → Pair a
  pure a = Pair a a
  (<*>) ∷ Pair (a → b) → Pair a → Pair b
  (<*>) (Pair f g) (Pair a b) = Pair (f a) (g b)

instance Arbitrary a ⇒ Arbitrary (Pair a) where
  arbitrary = do
    a ← arbitrary
    b ← arbitrary
    return (Pair a b)

instance Eq a ⇒ EqProp (Pair a) where
  (=-=) = eq

main = do
  print "a"
  quickBatch $ functor (undefined ∷ Pair (String, String, String))
  quickBatch $ functor (undefined ∷ Pair (String, String, String))
  -- quickCheck (prop_functorId' ∷ Pair String → Bool)
  -- quickCheck (prop_functorId' ∷ Pair Integer → Bool)
  -- quickCheck (prop_functorCompose' ∷ Pair String → Fun String String → Fun String String → Bool)
  -- quickCheck (prop_functorCompose' ∷ Pair String → Fun String Integer → Fun Integer String → Bool)
  -- quickCheck (prop_functorCompose' ∷ Pair Integer → Fun Integer Integer → Fun Integer Integer → Bool)
  -- quickCheck (prop_functorCompose' ∷ Pair Integer → Fun Integer String → Fun String Integer → Bool)
\end{code}
