\begin{code}

{-# LANGUAGE UnicodeSyntax #-}

module Main where

import Prelude.Unicode

import Test.QuickCheck

\end{code}
Function that checks any binary function for associative law.
\begin{code}
propAssoc ∷ (Eq m) ⇒ (m → m → m) → m → m → m → Bool
propAssoc f a b c = (f a (f b c)) ≡ (f (f a b) c)

newtype BoolDisj = BoolDisj Bool
  deriving (Eq, Show)

instance Semigroup BoolDisj where
  (<>) (BoolDisj a)  (BoolDisj b)  = BoolDisj (a ∨ b)

instance Arbitrary BoolDisj where
  arbitrary = do
    a ← arbitrary
    return $ BoolDisj a

type BoolDisjAssoc
  = (BoolDisj → BoolDisj → BoolDisj)
  → BoolDisj
  → BoolDisj
  → BoolDisj
  → Bool

main ∷ IO ()
main = do
  quickCheck ((propAssoc ∷ BoolDisjAssoc) (<>))

\end{code}
