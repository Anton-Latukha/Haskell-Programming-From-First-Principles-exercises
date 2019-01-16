\begin{code}
{-# LANGUAGE UnicodeSyntax #-}

module Main where

import Prelude.Unicode

import Test.QuickCheck

\end{code}
Using a code from 11.AlgebraicDatatypes/18.LanguageEx1.hs
\begin{code}

twice f = f . f
fourTimes = twice . twice

prop_IdempotenceSort x
  = (sort x ≡ twice sort x)
  ∧ (sort x ≡ fourTimes sort x)

main = quickCheck (prop_IdempotenceSort ∷ String → Bool)
\end{code}
