\begin{code}
{-# LANGUAGE UnicodeSyntax #-}

module Main where

import Prelude.Unicode

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

instance (Arbitrary e, Arbitrary a) ⇒ Arbitrary (Validation e a)
  where
    arbitrary = do
      e ← arbitrary
      a ← arbitrary
      oneof [return (Failure e), return (Success a)]

instance (Eq e, Eq a) ⇒ EqProp (Validation e a) where
  (=-=) = eq
  -- (Failure e1) =-= (Failure e2) = e1 `eq` e2
  -- (Success a1) =-= (Success a2) = a1 `eq` a2

\end{code}
\begin{code}

main ∷ IO ()
main = do
  quickBatch $ functor ((undefined undefined undefined) ∷ Validation String (String, String, String))
\end{code}
