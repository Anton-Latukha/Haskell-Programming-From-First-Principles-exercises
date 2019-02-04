\begin{code}
{-# LANGUAGE UnicodeSyntax #-}

module Main where

import Prelude.Unicode

import Test.QuickCheck

green = "\x1b[32m"
clean = "\x1b[0m"

\end{code}
\begin{code}

prop_ReadShow ∷ (Eq a, Read a, Show a) ⇒ a → Bool
prop_ReadShow x = (read (show x)) ≡ x

main = do
  putStrLn ("\n\n" ++ green ++
            "Testing:\n(read (show x)) ≡ x" ++ clean
           )
  quickCheck (prop_ReadShow ∷ String → Bool)
  putStrLn "\n\n"
\end{code}
