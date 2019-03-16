\begin{code}
{-# LANGUAGE UnicodeSyntax #-}

module Main where

import Prelude.Unicode

\end{code}

Since loads in REPL and compiles/executes - GHC typechecked that types are right.
\begin{code}

p ∷ Monoid c ⇒ a → (,) c a
p = pure
a ∷ Monoid c ⇒ (,) c (a → b) → (,) c a → (,) c b
a = (<*>)

main ∷ IO ()
main = print "a"
\end{code}
