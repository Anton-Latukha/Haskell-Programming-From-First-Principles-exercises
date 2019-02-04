\begin{code}
{-# LANGUAGE UnicodeSyntax #-}

module Main where

import Prelude.Unicode

import Test.QuickCheck

green = "\x1b[32m"
clean = "\x1b[0m"

\end{code}
`take` and `length` accept n >= 0, so expression is not true for n < 0.
Also take returns n only if n <= length xs.
\begin{code}

prop_TakeLength n xs = length (take n xs) ≡ n


main = do
  putStrLn ("\n\n" ++ green ++
            "Testing:\nlength (take n xs) ≡ n" ++ clean
           )
  quickCheck (prop_TakeLength ∷ Int → [Integer] → Bool)
  putStrLn "\n\n"
\end{code}
