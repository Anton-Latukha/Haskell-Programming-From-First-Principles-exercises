\begin{code}
{-# LANGUAGE UnicodeSyntax #-}

module Main where

import Prelude.Unicode

import Test.QuickCheck

\end{code}
Special case for laws - is division by zero.
\begin{code}

prop_QuotRem ∷ Integral a ⇒ a → a → Bool
prop_QuotRem _ 0 = True
prop_QuotRem x y = (quot x y) * y + (rem x y) ≡ x

prop_DivMod ∷ Integral a ⇒ a → a → Bool
prop_DivMod _ 0 = True
prop_DivMod x y = (div x y) * y + (mod x y) ≡ x

main = do
  quickCheck (prop_QuotRem ∷ Integer → Integer → Bool)
  quickCheck (prop_DivMod ∷ Integer → Integer → Bool)
\end{code}
