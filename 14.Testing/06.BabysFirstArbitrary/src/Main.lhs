\begin{code}
{-# LANGUAGE UnicodeSyntax #-}

module Main where

import Prelude.Unicode

import Test.QuickCheck
\end{code}

Creating a data type that has only one and trivial data constructor.
\begin{code}
data Trivial =
  Trivial
  deriving (Eq, Show)
\end{code}

Creating a function - generator for instances of Trivial.
\begin{code}
trivialGen ∷ Gen Trivial
trivialGen = return Trivial
\end{code}

Declaring that random istance generator for data type Trivial is  created
trivialGen function.
\begin{code}
instance Arbitrary Trivial where
  arbitrary = trivialGen
\end{code}

Bonus: let's also add a real quickCheck property that tests values and then
we would include it.
\begin{code}
prop_trivial ∷ Trivial → Bool
prop_trivial a = a ≡ Trivial
\end{code}

In main - first taking a sample of values from generator.

Then running a test of property.
\begin{code}
main ∷ IO ()
main = do
  putStrLn "\n\nTaking samples from generator:\n"
  sample trivialGen
  putStrLn "\n\nTesting that trivial property always returns Trivial value:\n"
  quickCheck (prop_trivial)
\end{code}
