\begin{code}
{-# LANGUAGE UnicodeSyntax #-}

module Main where

import Prelude.Unicode

import Test.QuickCheck

\end{code}
Using a code from ../../../11.AlgebraicDatatypes/18.LanguageEx1.hs
\begin{code}

import Language

twice f = f . f
fourTimes = twice . twice

prop_IdempotenceCapitalizeWord x
  = (capitalizeWord x ≡ twice capitalizeWord x)
  ∧ (capitalizeWord x ≡ fourTimes capitalizeWord x)

main = quickCheck (prop_IdempotenceCapitalizeWord ∷ String → Bool)
\end{code}
