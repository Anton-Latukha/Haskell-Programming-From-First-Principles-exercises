\begin{code}
{-# LANGUAGE UnicodeSyntax #-}

module BetterLivingThroughQuickCheck where

import Prelude.Unicode
import Data.Monoid
import Test.QuickCheck

asc ∷ Eq a ⇒ (a → a → a) → a → a → a → Bool
asc (<>) a b c = a <> (b <> c) ≡ (a <> b) <> c

monoidAssoc ∷ (Eq m, Monoid m) ⇒ m → m → m → Bool
monoidAssoc a b c = (a <> (b <> c)) ≡ ((a <> b) <> c)

\end{code}
