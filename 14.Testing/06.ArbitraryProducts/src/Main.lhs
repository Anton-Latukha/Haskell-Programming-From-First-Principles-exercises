\begin{code}
{-# LANGUAGE UnicodeSyntax #-}

module Main where

import Prelude.Unicode

import Test.QuickCheck

data Pair a b = Pair a b
  deriving (Eq, Show)
\end{code}

Here we can see that the product type arbitrary is two independed arbitrary
generations bundled together. Just as product types themself.
\begin{code}
pairGen ∷ (Arbitrary a, Arbitrary b) ⇒ Gen (Pair a b)
pairGen = do
  a ← arbitrary
  b ← arbitrary
  return (Pair a b)

instance (Arbitrary a, Arbitrary b) ⇒ Arbitrary (Pair a b) where
  arbitrary = pairGen

pairGenIntString ∷ Gen (Pair Int String)
pairGenIntString = pairGen

main = sample pairGenIntString
\end{code}
