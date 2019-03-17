\begin{code}
{-# LANGUAGE UnicodeSyntax #-}
{-# LANGUAGE InstanceSigs #-}

module Main where

import Prelude.Unicode

import Test.QuickCheck
import Test.QuickCheck.Classes
import Test.QuickCheck.Checkers

data Two a b = Two a b
  deriving (Eq, Show)

instance Functor (Two a) where
  fmap f (Two a b) = Two a (f b)

instance Monoid a ⇒ Applicative (Two a) where
  pure ∷ b → Two a b
  pure a = Two mempty a
  (<*>) ∷ Two a (b → c) → Two a b → Two a c
  (<*>) (Two a1 f) (Two a2 b2) = Two (a1 <> a2) (f b2)

instance (Arbitrary a, Arbitrary b) ⇒ Arbitrary (Two a b) where
  arbitrary = do
    a ← arbitrary
    b ← arbitrary
    return (Two a b)

instance (Eq a, Eq b) ⇒ EqProp (Two a b) where
  (=-=) = eq

u = undefined

type S = String
type I = Integer
type B = Bool
type Two3 b = Two S (b, b, b)

quickie ∷ t → (t → TestBatch) → IO ()
quickie t f = quickBatch $ f u

main = do
  quickie (u ∷ Two3 S) functor
  quickie (u ∷ Two3 I) functor
  quickie (u ∷ Two3 B) functor
  quickie (u ∷ Two S (S, I, S)) functor
  quickie (u ∷ Two S (I, S, I)) functor
  quickie (u ∷ Two S (S, I, B)) functor
  quickie (u ∷ Two3 S) applicative
  quickie (u ∷ Two3 I) applicative
  quickie (u ∷ Two3 B) applicative
  quickie (u ∷ Two S (S, I, S)) applicative
  quickie (u ∷ Two S (I, S, I)) applicative
  quickie (u ∷ Two S (S, I, B)) applicative
\end{code}
