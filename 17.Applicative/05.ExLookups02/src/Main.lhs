\begin{code}
{-# LANGUAGE UnicodeSyntax #-}

module Main where

import Prelude.Unicode


y ∷ Maybe Integer
y = lookup 3 $ zip [1, 2, 3] [4, 5, 6]

z ∷ Maybe Integer
z = lookup 2 $ zip [1, 2, 3] [4, 5, 6]

tupled ∷ Maybe (Integer, Integer)
tupled = (,) <$> y <*> z

main ∷ IO ()
main = print tupled
\end{code}
