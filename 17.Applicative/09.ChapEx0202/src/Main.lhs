\begin{code}
{-# LANGUAGE UnicodeSyntax #-}
{-# LANGUAGE InstanceSigs #-}

module Main where

import Prelude.Unicode

import Test.QuickCheck
import Test.QuickCheck.Classes
import Test.QuickCheck.Checkers

data Two c b = Two c b
  deriving (Eq, Show)

instance Functor (Two c) where
  fmap f (Two c a) = Two c (f a)

instance (Monoid c) ⇒ Applicative (Two c) where
  pure ∷ a → Two c a
  pure a = Two mempty a
  (<*>) ∷ Two c (a → b) → Two c a → Two c b
  (<*>) (Two c1 f) (Two c2 b2) = Two (c1 <> c2) (f b2)

instance (Arbitrary c, Arbitrary a) ⇒ Arbitrary (Two c a) where
  arbitrary = do
    c ← arbitrary
    a ← arbitrary
    return (Two c a)

instance (Eq c, Eq a) ⇒ EqProp (Two c a) where
  (=-=) = eq

u = undefined

type S = String
type I = Integer
type B = Bool
type Two3 a = Two S (a, a, a)

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
