\begin{code}
{-# LANGUAGE UnicodeSyntax #-}

module Main where

import Prelude.Unicode

mcomp ∷ Monad m
  ⇒ (b → m c)
  → (a → m b)
  → a → m c
mcomp f g a = f (g a)

mcomp' ∷ Monad m
  ⇒ (b → m c)
  → (a → m b)
  → a → m c
mcomp' f g a = join (f <$> (g a))

mcomp'' ∷ Monad m
  ⇒ (b → m c)
  → (a → m b)
  → a → m c
mcomp'' f g a = g a >>= f

\end{code}
\begin{code}
main ∷ IO ()
main = print "a"
\end{code}
