\begin{code}
{-# LANGUAGE UnicodeSyntax #-}
{-# LANGUAGE InstanceSigs #-}

module Main where

import Prelude.Unicode

newtype StateT s m a = StateT { runStateT :: s -> m (a, s) }

instance
  Monad m =>
  Functor (StateT s m) where
  fmap :: (a -> b) -> StateT s m a -> StateT s m b
  fmap f m = StateT $
    \ s -> do
      (x, s') <- runStateT m s
      pure (f x, s')

\end{code}
\begin{code}
main ∷ IO ()
main = print "a"
\end{code}
