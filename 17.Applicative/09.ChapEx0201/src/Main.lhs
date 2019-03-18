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

u = undefined

type S = String
type I = Integer
type B = Bool
type Pair3 a = Pair (a, a, a)

quickie ∷ t → (t → TestBatch) → IO ()
quickie t f = quickBatch $ f u

main = do
  quickie (u ∷ Pair3 S) functor
  quickie (u ∷ Pair3 I) functor
  quickie (u ∷ Pair3 B) functor
  quickie (u ∷ Pair3 S) applicative
  quickie (u ∷ Pair3 I) applicative
  quickie (u ∷ Pair3 B) applicative
\end{code}
