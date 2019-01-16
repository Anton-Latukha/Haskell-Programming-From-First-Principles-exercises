\begin{code}
{-# LANGUAGE UnicodeSyntax #-}

module Main where

import Prelude.Unicode

import Test.QuickCheck

\end{code}
Square roots of numbers often are irrational numbers.
Irration number guranteed not to fit into any dot-notation number type,
because in the dot notation - they are endless.
So Floating point types can not hold irrational numbers precisely.
That is why quite often the power of the stored rounded square root result
- is near, but not equals initial number.
\begin{code}

square x = x * x
squareIdentity ∷ (Floating a) ⇒ a → a
squareIdentity = square . sqrt

prop_SquareIdentity x = squareIdentity x ≡ x

main = do
  quickCheck (prop_SquareIdentity ∷ Float → Bool)
  quickCheck (prop_SquareIdentity ∷ Double → Bool)
\end{code}
