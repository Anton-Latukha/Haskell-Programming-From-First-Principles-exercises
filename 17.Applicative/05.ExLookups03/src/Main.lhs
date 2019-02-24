\begin{code}
{-# LANGUAGE UnicodeSyntax #-}

module Main where

import Prelude.Unicode
import Data.List (elemIndex)


x ∷ Maybe Int
x = elemIndex 3 [1, 2, 3, 4, 5]

y ∷ Maybe Int
y = elemIndex 4 [1, 2, 3, 4, 5]

max' ∷ Int → Int → Int
max' = max

maxed ∷ Maybe Int
maxed = max' <$> x <*> y

main ∷ IO ()
main = print maxed
\end{code}
