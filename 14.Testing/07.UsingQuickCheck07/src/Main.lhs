\begin{code}
{-# LANGUAGE UnicodeSyntax #-}

module Main where

import Prelude.Unicode

import Test.QuickCheck

\end{code}
Unwrapping the pointfree syntax, for troublefree testing.
\begin{code}

prop_Reverse ∷ Eq a ⇒ [a] → Bool
prop_Reverse list = reverse (reverse list) ≡ id list

main = do
  quickCheck (prop_Reverse ∷ String → Bool)
  quickCheck (prop_Reverse ∷ [Integer] → Bool)
\end{code}
