\begin{code}
{-# LANGUAGE UnicodeSyntax #-}

module Main where

import Prelude.Unicode

\end{code}

Inside QuickCkeck already exists `Success` constructor, quintifying.
\begin{code}
import Test.QuickCheck (Arbitrary, arbitrary, oneof)
import Test.QuickCheck.Classes
import Test.QuickCheck.Checkers

data Validation e a
  = Failure e
  | Success a
  deriving (Eq, Show)

instance Functor (Validation e)
  where
    fmap _ (Failure e) = Failure e
    fmap f (Success a) = Success $ f a

instance Monoid e ⇒ Applicative (Validation e)
  where
    pure a = Success a
    (<*>) (Failure e1) (Failure e2) = Failure (e1 <> e2)
    (<*>) (Failure e1) _ = Failure e1
    (<*>) (Success a1) (Failure e1) = Failure e1
    (<*>) (Success a1) (Success a2) = Success (a1 a2)

instance (Arbitrary e, Arbitrary a) ⇒ Arbitrary (Validation e a)
  where
    arbitrary = do
      e ← arbitrary
      a ← arbitrary
      oneof [return (Failure e), return (Success a)]

instance (Eq e, Eq a) ⇒ EqProp (Validation e a) where
  (=-=) = eq

\end{code}

Let's abstract over quckBatch list a bit.
\begin{code}

u = undefined

type ErrStr = Validation String

quickie ∷ t → (ErrStr t → TestBatch) → IO ()
quickie t f = quickBatch $ f u

main ∷ IO ()
main = do
  quickie (u ∷ (String, String, String)) functor
  quickie (u ∷ (String, String, String)) functor
  quickie (u ∷ (Integer, Integer, Integer)) functor
  quickie (u ∷ (Double, String, Bool)) functor
  quickie (u ∷ (String, String, String)) applicative
  quickie (u ∷ (Integer, Integer, Integer)) applicative
  quickie (u ∷ (Double, String, Bool)) applicative
\end{code}
