Applicative instance for ReaderT.

\begin{code}
{-# LANGUAGE UnicodeSyntax #-}
{-# LANGUAGE InstanceSigs #-}

module Main where

import Prelude.Unicode
import Control.Applicative

newtype ReaderT r m a = ReaderT { runReaderT :: r -> m a}

instance Functor m
  => Functor (ReaderT r m)
 where
  fmap f (ReaderT rma) = ReaderT $ (fmap . fmap) f rma

instance Applicative m
  => Applicative (ReaderT r m)
 where
  pure a = ReaderT $ pure . pure a
  (<*>) (ReaderT rmf) (ReaderT rma) = ReaderT $ (liftA2 (<*>)) rmf rma

-- instance Monad m
--   => Monad (ReaderT r m)
--  where
--   (>>=) :: ReaderT r m a -> (a -> ReaderT r m b) -> ReaderT r m b
--   (>>=) (ReaderT rma) atRTrmb  = ReaderT $ \r -> do
--     runReaderT (k (rma atRTrmb)) r

instance Monad m
  => Monad (ReaderT r m)
 where
  (>>=) :: ReaderT r m a -> (a -> ReaderT r m b) -> ReaderT r m b
  (>>=) (ReaderT rma) atRTrmb  = ReaderT $ \ r ->
    (>>=) (rma r) (\ a -> runReaderT (atRTrmb a) r)

\end{code}
\begin{code}
main ∷ IO ()
main = print "a"
\end{code}
