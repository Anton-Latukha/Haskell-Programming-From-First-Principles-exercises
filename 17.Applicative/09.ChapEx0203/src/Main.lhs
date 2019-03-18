\begin{code}
{-# LANGUAGE UnicodeSyntax #-}
{-# LANGUAGE InstanceSigs #-}

module Main where

import Prelude.Unicode

import Test.QuickCheck
import Test.QuickCheck.Classes
import Test.QuickCheck.Checkers

data Three c d b = Three c d b
  deriving (Eq, Show)

instance Functor (Three c d) where
  fmap f (Three c d a) = Three c d (f a)

instance (Monoid c, Monoid d) ⇒ Applicative (Three c d) where
  pure ∷ a → Three c d a
  pure a = Three mempty mempty a
  (<*>) ∷ Three c d (a → b) → Three c d a → Three c d b
  (<*>) (Three c1 d1 f) (Three c2 d2 b2) = Three (c1 <> c2) (d1 <> d2) (f b2)

instance (Arbitrary c, Arbitrary d, Arbitrary a) ⇒ Arbitrary (Three c d a) where
  arbitrary = do
    c ← arbitrary
    d ← arbitrary
    a ← arbitrary
    return (Three c d a)

instance (Eq c, Eq d, Eq a) ⇒ EqProp (Three c d a) where
  (=-=) = eq

u = undefined

type S = String
type I = Integer
type B = Bool
type Three3 a = Three (S, [I]) (S, [I]) (a, a, a)

quickie ∷ t → (t → TestBatch) → IO ()
quickie t f = quickBatch $ f u

main = do
  quickie (u ∷ Three3 S) functor
  quickie (u ∷ Three3 I) functor
  quickie (u ∷ Three3 B) functor
  quickie (u ∷ Three3 S) applicative
  quickie (u ∷ Three3 I) applicative
  quickie (u ∷ Three3 B) applicative
\end{code}
