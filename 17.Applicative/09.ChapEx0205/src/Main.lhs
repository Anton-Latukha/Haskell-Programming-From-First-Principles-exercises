\begin{code}
{-# LANGUAGE UnicodeSyntax #-}
{-# LANGUAGE InstanceSigs #-}

module Main where

import Prelude.Unicode

import Test.QuickCheck
import Test.QuickCheck.Classes
import Test.QuickCheck.Checkers

data Four c d e b = Four c d e b
  deriving (Eq, Show)

instance Functor (Four c d e) where
  fmap f (Four c d e a) = Four c d e (f a)

instance (Monoid c, Monoid d, Monoid e) ⇒ Applicative (Four c d e) where
  pure ∷ a → Four c d e a
  pure a = Four mempty mempty mempty a
  (<*>) ∷ Four c d e (a → b) → Four c d e a → Four c d e b
  (<*>) (Four c1 d1 e1 f) (Four c2 d2 e2 b2) = Four (c1 <> c2) (d1 <> d2) (e1 <> e2) (f b2)

instance (Arbitrary c, Arbitrary d, Arbitrary e, Arbitrary a) ⇒ Arbitrary (Four c d e a) where
  arbitrary = do
    c ← arbitrary
    d ← arbitrary
    e ← arbitrary
    a ← arbitrary
    return (Four c d e a)

instance (Eq c, Eq d, Eq e, Eq a) ⇒ EqProp (Four c d e a) where
  (=-=) = eq

u = undefined

type S = String
type I = Integer
type B = Bool
type Four3 a = Four (S, [Int]) (S, [Int]) (S, [Int]) (a, a, a)

quickie ∷ t → (t → TestBatch) → IO ()
quickie t f = quickBatch $ f u

main = do
  quickie (u ∷ Four3 S) functor
  quickie (u ∷ Four3 I) functor
  quickie (u ∷ Four3 B) functor
  quickie (u ∷ Four3 S) applicative
  quickie (u ∷ Four3 I) applicative
  quickie (u ∷ Four3 B) applicative
\end{code}
