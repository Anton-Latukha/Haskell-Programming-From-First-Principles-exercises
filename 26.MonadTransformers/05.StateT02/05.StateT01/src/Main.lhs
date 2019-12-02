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
  fmap atb sTma = StateT $ \ s -> (>>=) (runStateT sTma s) $ \ a -> pure (atb (fst a), snd a)

\end{code}
\begin{code}
main ∷ IO ()
main = print "a"
\end{code}
