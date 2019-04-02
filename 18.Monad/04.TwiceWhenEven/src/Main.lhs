\begin{code}
{-# LANGUAGE UnicodeSyntax #-}

module Main where

import Prelude.Unicode

twiceWhenEven :: [Integer] -> [Integer]
twiceWhenEven xs = do
  x <- xs
  if even x
    then [x*x, x*x]
    else [x*x]

twiceWhenEven' :: [Integer] -> [Integer]
twiceWhenEven' xs = do
  x <- xs
  if even x
    then [x*x, x*x]
    else []

main ∷ IO ()
main = do
  putStrLn "\nRunning `twiceWhenEven [1..3]`:"
  twiceWhenEven [1..3]
  putStrLn "\nRunning `twiceWhenEven' [1..3]`:"
  twiceWhenEven' [1..3]
  putStrLn "\nPlease, run twiceWhenEven and twiceWhenEven' and provide them your [Integers]. "
\end{code}
