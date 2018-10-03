\begin{code}

{-# LANGUAGE UnicodeSyntax #-}

module ModuleName where

import Prelude.Unicode

import Test.QuickCheck

\end{code}
Function that checks any binary function for associative law.
\begin{code}
propAssoc ∷ (Eq m) ⇒ (m → m → m) → m → m → m → Bool
propAssoc f a b c = (f a (f b c)) ≡ (f (f a b) c)

newtype BoolConj = BoolConj Bool
  deriving (Eq, Show)

instance Semigroup BoolConj where
  (<>) (BoolConj a)  (BoolConj b)  = BoolConj (a ∧ b)

instance Arbitrary BoolConj where
  arbitrary = do
    a ← arbitrary
    return $ BoolConj a

type BoolConjAssoc
  = (BoolConj → BoolConj → BoolConj)
  → BoolConj
  → BoolConj
  → BoolConj
  → Bool

main ∷ IO ()
main = do
  quickCheck ((propAssoc ∷ BoolConjAssoc) (<>))

\end{code}
