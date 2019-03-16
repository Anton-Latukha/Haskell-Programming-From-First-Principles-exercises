\begin{code}
{-# LANGUAGE UnicodeSyntax #-}

{-# LANGUAGE InstanceSigs #-}

module Main where

import Prelude.Unicode

\end{code}

Since loads in REPL and compiles/executes - GHC typechecked that types are right.
\begin{code}
data List a = Nil | Cons a (List a)
  deriving (Eq, Show)

instance Functor List
  where
    fmap ∷ (a → b) → List a → List b
    fmap = undefined

instance Applicative List
  where
    pure ∷ a → List a
    pure = undefined
    (<*>) ∷ List (a → b) → List a → List b
    (<*>) = undefined

main ∷ IO ()
main = print "a"
\end{code}
