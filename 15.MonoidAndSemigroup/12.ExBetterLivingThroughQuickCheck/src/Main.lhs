\begin{code}
{-# LANGUAGE UnicodeSyntax #-}

module Main where

import Prelude.Unicode
import Data.Monoid
import Test.QuickCheck

asc ∷ Eq a ⇒ (a → a → a) → a → a → a → Bool
asc (<>) a b c = a <> (b <> c) ≡ (a <> b) <> c

monoidAssoc ∷ (Eq m, Monoid m) ⇒ m → m → m → Bool
monoidAssoc a b c = (a <> (b <> c)) ≡ ((a <> b) <> c)

monoidLeftIdentity ∷ (Eq m, Monoid m) ⇒ m → Bool
monoidLeftIdentity a = mempty <> a ≡ a

monoidRightIdentity ∷ (Eq m, Monoid m) ⇒ m → Bool
monoidRightIdentity a = (a <> mempty) ≡ a

type S = String
type B = Bool
type SB = S → S → S → B

main ∷ IO ()
main = do
 quickCheck (monoidAssoc :: SB)
 quickCheck (monoidLeftIdentity :: S → B)
 quickCheck (monoidRightIdentity :: S → B)

\end{code}
