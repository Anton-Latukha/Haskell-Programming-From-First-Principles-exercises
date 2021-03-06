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

instance
  Monad m =>
  Applicative (StateT s m) where
  pure :: a -> StateT s m a
  pure a = StateT $ \ s -> pure (a, s)
  (<*>) :: StateT s m (a -> b) -> StateT s m a -> StateT s m b
  (<*>) mf m = StateT $
    \ s -> do
      (f, _) <- runStateT mf s
      (x, s') <- runStateT m s
      pure (f x, s')

instance
  Monad m =>
  Monad (StateT s m) where
  (>>=) :: StateT s m a -> (a -> (StateT s m b)) -> StateT s m b
  (>>=) ma atmb = StateT $
    \ s -> do
      (a, s') <- runStateT ma s
      runStateT (atmb a) s'

\end{code}
\begin{code}
main ∷ IO ()
main = print "a"
\end{code}
