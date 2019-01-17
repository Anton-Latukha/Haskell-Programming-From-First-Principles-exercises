\begin{code}
{-# LANGUAGE UnicodeSyntax #-}

module Main where

import Prelude.Unicode

import Test.QuickCheck

\end{code}
For equal probability use oneof.
\begin{code}

data Fool
  = Fulse
  | Frue
  deriving (Eq, Show)

instance Arbitrary Fool where
  arbitrary = frequency [ (2, (return Fulse)), (1, (return Frue)) ]

main = sample (arbitrary ∷ Gen Fool)
\end{code}
