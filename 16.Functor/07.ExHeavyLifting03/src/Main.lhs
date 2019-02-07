\begin{code}
{-# LANGUAGE UnicodeSyntax #-}

module Main where

import Prelude.Unicode

c = fmap (*2) (\x -> x - 2)

main = print (c 1)
\end{code}
