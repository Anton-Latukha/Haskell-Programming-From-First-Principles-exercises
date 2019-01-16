\begin{code}
{-# LANGUAGE UnicodeSyntax #-}

module Main where

import Prelude.Unicode

import Test.QuickCheck

\end{code}

Creata a data type with arity one and one constructor.
\begin{code}

data Identity a =
  Identity a
  deriving (Eq, Show)

\end{code}

Create a polymorphic generator that wraps any type into Identity constructor.
\begin{code}

identityGen ∷ Arbitrary a ⇒ Gen (Identity a)
identityGen = do
  a ← arbitrary
  return (Identity a)

\end{code}

Bind generator to instance of Arbitrary.
\begin{code}

instance Arbitrary a ⇒ Arbitrary (Identity a) where
  arbitrary = identityGen

\end{code}

Create a fucntion that generates Int values.
\begin{code}

identityGenInt ∷ Gen (Identity Int)
identityGenInt = identityGen

main ∷ IO ()
main = do
  putStrLn "\n\n\x1b[32mGenerating values of Identity Int:\n\x1b[m" -- Also using terminal color escape codes.
  sample identityGenInt
\end{code}
