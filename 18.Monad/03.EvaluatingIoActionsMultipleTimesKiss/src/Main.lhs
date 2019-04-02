\begin{code}
{-# LANGUAGE UnicodeSyntax #-}

module Main where

import Prelude.Unicode
import System.Random (randomRIO)

main ∷ IO ()
main = do
  b ← randomRIO (False, True)
  putStr $ if b
    then "1"
    else "2"
  main

\end{code}
