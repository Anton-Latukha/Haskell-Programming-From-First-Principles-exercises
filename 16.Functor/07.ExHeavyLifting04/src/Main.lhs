\begin{code}
{-# LANGUAGE UnicodeSyntax #-}

module Main where

import Prelude.Unicode

d = fmap ((return '1' ++) . show) (\x -> [x, 1..3])

main = print (d 0)
\end{code}
