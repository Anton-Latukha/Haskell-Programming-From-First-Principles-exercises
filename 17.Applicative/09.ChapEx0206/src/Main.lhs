\begin{code}
{-# LANGUAGE UnicodeSyntax #-}
{-# LANGUAGE InstanceSigs #-}

module Main where

import Prelude.Unicode

import Test.QuickCheck
import Test.QuickCheck.Classes
import Test.QuickCheck.Checkers

data Four' c b = Four' c c c b
  deriving (Eq, Show)

instance Functor (Four' c) where
  fmap f (Four' c1 c2 c3 a) = Four' c1 c2 c3 (f a)

instance (Monoid c) ⇒ Applicative (Four' c ) where
  pure ∷ a → Four' c a
  pure a = Four' mempty mempty mempty a
  (<*>) ∷ Four' c (a → b) → Four' c a → Four' c b
  (<*>) (Four' c11 c12 c13 f) (Four' c21 c22 c23 b2) = Four' (c11 <> c21) (c12 <> c22) (c13 <> c23) (f b2)

instance (Arbitrary c, Arbitrary a) ⇒ Arbitrary (Four' c a) where
  arbitrary = do
    c1 ← arbitrary
    c2 ← arbitrary
    c3 ← arbitrary
    a ← arbitrary
    return (Four' c1 c2 c3 a)

instance (Eq c, Eq a) ⇒ EqProp (Four' c a) where
  (=-=) = eq

u = undefined

type S = String
type I = Integer
type B = Bool
type Four'3 a = Four' (S, [I]) (a, a, a)

quickie ∷ t → (t → TestBatch) → IO ()
quickie t f = quickBatch $ f u

main = do
  quickie (u ∷ Four'3 S) functor
  quickie (u ∷ Four'3 I) functor
  quickie (u ∷ Four'3 B) functor
  quickie (u ∷ Four'3 S) applicative
  quickie (u ∷ Four'3 I) applicative
  quickie (u ∷ Four'3 B) applicative
\end{code}
