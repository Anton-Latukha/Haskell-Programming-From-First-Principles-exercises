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

data Three a b c = Three a b c
  deriving (Eq, Show)

instance (Semigroup t1, Semigroup t2, Semigroup t3) ⇒ Semigroup (Three t1 t2 t3) where
  (<>) (Three a1 b1 c1) (Three a2 b2 c2) = Three (a1 <> a2) (b1 <> b2) (c1 <> c2)

instance (Arbitrary t1, Arbitrary t2, Arbitrary t3) ⇒ Arbitrary (Three t1 t2 t3) where
  arbitrary = do
    a ← arbitrary
    b ← arbitrary
    c ← arbitrary
    return $ Three a b c

type ThreeAssoc t1 t2 t3
  = (Three t1 t2 t3 → Three t1 t2 t3  → Three t1 t2 t3)
  → Three t1 t2 t3
  → Three t1 t2 t3
  → Three t1 t2 t3
  → Bool

main ∷ IO ()
main = do
  quickCheck ((propAssoc ∷ ThreeAssoc String String String) (<>))
\end{code}
