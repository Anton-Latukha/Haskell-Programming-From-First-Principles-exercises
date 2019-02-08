\begin{code}
{-# LANGUAGE UnicodeSyntax #-}

\end{code}

This pragma seems unneeded.

\begin{code}
--{-# LANGUAGE ViewPatterns #-}

module Main where

import Prelude.Unicode

import Test.QuickCheck
import Test.QuickCheck.Function

\end{code}

Property declaration uses a type for autogenerating function
(Fun from QuickCheck.Function)

\begin{code}
functorCompose' :: (Eq (f c), Functor f) => f a -> Fun a b -> Fun b c -> Bool
functorCompose' x (Fun _ f) (Fun _ g) = (fmap (g . f) x) == (fmap g . fmap f $ x)

type IntToInt = Fun Int Int

type IntFC
  = [Int]
  → IntToInt
  → IntToInt
  → Bool

fc' = functorCompose'

main = quickCheck (fc' ∷ IntFC)
\end{code}
