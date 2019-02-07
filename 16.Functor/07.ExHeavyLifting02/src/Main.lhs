\begin{code}
{-# LANGUAGE UnicodeSyntax #-}

module Main where

import Prelude.Unicode

b = (fmap . fmap) (++ "lol") (Just ["Hi,", "Hello"])

main = print b
\end{code}
