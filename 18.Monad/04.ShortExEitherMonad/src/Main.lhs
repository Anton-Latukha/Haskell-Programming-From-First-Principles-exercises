\begin{code}
{-# LANGUAGE UnicodeSyntax #-}
{-# LANGUAGE InstanceSigs #-}

module Main where

import Prelude.Unicode
import Control.Monad (join)

import Test.QuickCheck
import Test.QuickCheck.Classes
import Test.QuickCheck.Checkers

data Sum a b
  = First a
  | Second b
  deriving (Eq, Show)

instance Semigroup (Sum a b) where
  (<>) (Second a) _ = Second a
  (<>) _ (Second a) = Second a
  (<>) _ (First a) = First a

\end{code}

From Semigroup definition is seen - there is no Identity element possible, and so Monoid also.
From GHCI also can be seen there is no Monoid for Either.
\begin{code}

instance Functor (Sum c) where
  fmap ∷ (a → b) → Sum c a → Sum c b
  fmap fab (Second a) = Second (fab a)
  fmap fab (First a) = First a

instance Applicative (Sum c) where
  pure ∷ a → Sum c a
  pure a = Second a
  (<*>) ∷ Sum c (a → b) → Sum c a → Sum c b
  (<*>) (First fab) _ = (First fab)
  (<*>) _ (First a) = (First a)
  (<*>) (Second fab) (Second a) = Second (fab a)

\end{code}

To be honest, I made code looking at Either input and output.
\begin{code}
instance Monad (Sum c) where
  return = pure
  (>>=) ∷ Sum c a → (a → Sum c b) → Sum c b
  (>>=) (First a) _ = First a
  (>>=) (Second a) f =
    case (f a) of
      First b → First b
      Second b → Second b

\end{code}

Automating the testing.
\begin{code}
instance (Arbitrary a, Arbitrary b) ⇒ Arbitrary (Sum a b) where
  arbitrary = do
    a ← arbitrary
    b ← arbitrary
    oneof [return (First a), return (Second b)]


instance (Eq a, Eq b) ⇒ EqProp (Sum a b) where
  (=-=) = eq

u = undefined

type S = String
type I = Integer
type B = Bool
type Sumc3 a = Sum (S, I, B) (a, a, a)

quickie ∷ t → (t → TestBatch) → IO ()
quickie t f = quickBatch $ f u

main ∷ IO ()
main = do
  quickie (u ∷ Sumc3 S) semigroup
  quickie (u ∷ Sumc3 I) semigroup
  quickie (u ∷ Sumc3 B) semigroup
  quickie (u ∷ Sumc3 S) functor
  quickie (u ∷ Sumc3 I) functor
  quickie (u ∷ Sumc3 B) functor
  quickie (u ∷ Sumc3 S) applicative
  quickie (u ∷ Sumc3 I) applicative
  quickie (u ∷ Sumc3 B) applicative
  quickie (u ∷ Sumc3 S) monad
  quickie (u ∷ Sumc3 I) monad
  quickie (u ∷ Sumc3 B) monad
\end{code}
