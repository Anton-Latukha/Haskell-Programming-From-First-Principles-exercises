\begin{code}

{-# LANGUAGE UnicodeSyntax #-}

module Main where

import Prelude.Unicode

import Test.QuickCheck

data Or a b
  = Fst a
  | Snd b
  deriving (Eq, Show)

instance Semigroup (Or t1 t2) where
  (<>) (Snd b1) _ = Snd b1
  (<>) _ (Snd b2) = Snd b2
  (<>) _ (Fst a2) = Fst a2

instance (Arbitrary t1, Arbitrary t2) ⇒ Arbitrary (Or t1 t2) where
  arbitrary = do
    a ← arbitrary
    b ← arbitrary
    frequency [ (50, return $ Fst a), (50, return $ Snd b) ]

type OrAssoc t1 t2
  = (Or t1 t2 → Or t1 t2 -> Or t1 t2)
  → Or t1 t2
  → Or t1 t2
  → Or t1 t2
  → Bool

\end{code}
Function that checks any binary function for associative law.
\begin{code}
propAssoc ∷ (Eq m) ⇒ (m → m → m) → m → m → m → Bool
propAssoc f a b c = (f a (f b c)) ≡ (f (f a b) c)


main ∷ IO ()
main = do
  quickCheck ((propAssoc ∷ OrAssoc String Integer) (<>))

\end{code}
