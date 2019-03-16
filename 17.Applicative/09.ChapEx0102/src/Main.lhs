\begin{code}
{-# LANGUAGE UnicodeSyntax #-}

module Main where

import Prelude.Unicode

\end{code}

Since loads in REPL and compiles/executes - GHC typechecked that types are right.
\begin{code}
p = pure ∷ a → IO a
a = (<*>) ∷ IO (a → b) → IO a → IO b

main ∷ IO ()
main = print "a"
\end{code}
