\begin{code}
{-# LANGUAGE UnicodeSyntax #-}
{-# LANGUAGE InstanceSigs #-}

module Main where

import Prelude.Unicode
import Control.Monad.Trans

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
      (a, _) <- runStateT ma s
      (b, s') <- runStateT (atmb a) s
      pure (b, s')

instance MonadTrans (StateT s)
 where
  lift :: Monad m => m a -> StateT s m a
  lift ma = StateT (\ s -> ma >>= (\ a -> pure (a, s)))

\end{code}
\begin{code}
main ∷ IO ()
main = print "a"
\end{code}
