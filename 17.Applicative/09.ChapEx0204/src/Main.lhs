\begin{code}
{-# LANGUAGE UnicodeSyntax #-}
{-# LANGUAGE InstanceSigs #-}

module Main where

import Prelude.Unicode

import Test.QuickCheck
import Test.QuickCheck.Classes
import Test.QuickCheck.Checkers

data Three' c b = Three' c b b
  deriving (Eq, Show)

instance Functor (Three' c) where
  fmap f (Three' c d a) = Three' c (f d) (f a)

instance (Monoid c) ⇒ Applicative (Three' c) where
  pure ∷ a → Three' c a
  pure a = Three' mempty a a
  (<*>) ∷ Three' c (a → b) → Three' c a → Three' c b
  (<*>) (Three' c1 g f) (Three' c2 d2 b2) = Three' (c1 <> c2) (g d2) (f b2)

instance (Arbitrary c, Arbitrary a) ⇒ Arbitrary (Three' c a) where
  arbitrary = do
    c ← arbitrary
    d ← arbitrary
    a ← arbitrary
    return (Three' c d a)

instance (Eq c, Eq a) ⇒ EqProp (Three' c a) where
  (=-=) = eq

u = undefined

type S = String
type I = Integer
type B = Bool
type Three'3 a = Three' S (a, a, a)

quickie ∷ t → (t → TestBatch) → IO ()
quickie t f = quickBatch $ f u

main = do
  quickie (u ∷ Three'3 S) functor
  quickie (u ∷ Three'3 I) functor
  quickie (u ∷ Three'3 B) functor
  quickie (u ∷ Three' S (S, I, S)) functor
  quickie (u ∷ Three' S (I, S, I)) functor
  quickie (u ∷ Three' S (S, I, B)) functor
  quickie (u ∷ Three'3 S) applicative
  quickie (u ∷ Three'3 I) applicative
  quickie (u ∷ Three'3 B) applicative
  quickie (u ∷ Three' S (S, I, S)) applicative
  quickie (u ∷ Three' S (I, S, I)) applicative
  quickie (u ∷ Three' S (S, I, B)) applicative
\end{code}
