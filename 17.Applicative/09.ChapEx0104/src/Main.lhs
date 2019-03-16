\begin{code}
{-# LANGUAGE UnicodeSyntax #-}

module Main where

import Prelude.Unicode

\end{code}

Since loads in REPL and compiles/executes - GHC typechecked that types are right.
\begin{code}

p ∷ a → e → a
p = pure
a ∷ (e → (a → b)) → (e → a) → (e → b)
a = (<*>)

main ∷ IO ()
main = print "a"
\end{code}
