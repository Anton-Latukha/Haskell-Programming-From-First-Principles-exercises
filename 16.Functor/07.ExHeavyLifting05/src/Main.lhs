\begin{code}
{-# LANGUAGE UnicodeSyntax #-}

module Main where

import Prelude.Unicode

e = let ioi = read "1" ∷ Integer
        changed = ((show (read "123" ∷ Integer)) ++ show ioi)
    in (*3) (read changed ∷ Integer)

\end{code}

In the second example that is closer to the provided code
we lift over IO to get to the Integer.

\begin{code}
e1 :: IO Integer
e1 = let ioi = readIO "1" ∷ IO Integer
         changed = fmap (read . ("123"++) . show) ioi
     in fmap (*3) changed

main = do
  print e
  fmap (show) e1
\end{code}
