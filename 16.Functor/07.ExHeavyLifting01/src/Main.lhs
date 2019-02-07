\begin{code}
{-# LANGUAGE UnicodeSyntax #-}

module Main where

import Prelude.Unicode

a = fmap (+1) $ read "[1]" :: [Int]

main = print a
\end{code}
