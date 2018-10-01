\begin{code}

{-# LANGUAGE UnicodeSyntax #-}

module ModuleName where

import Prelude.Unicode

import Test.QuickCheck
\end{code}

Getting Sum/getSum from Semigroup
\begin{code}
import Data.Semigroup

\end{code}
Function that checks any binary function for associative law.
\begin{code}
propAssoc ∷ (Eq m) ⇒ (m → m → m) → m → m → m → Bool
propAssoc f a b c = (f a (f b c)) ≡ (f (f a b) c)

newtype Combine a b =
Combine { unCombine :: (a -> b) }

\end{code}
