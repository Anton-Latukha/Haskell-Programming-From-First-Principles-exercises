\begin{code}
{-# LANGUAGE UnicodeSyntax #-}
{-# LANGUAGE InstanceSigs #-}
{-# LANGUAGE LambdaCase #-}

import Control.Monad.IO.Class (MonadIO(..))
import Control.Applicative (liftA2)
import Control.Monad.Trans

newtype ReaderT r m a = ReaderT { runReaderT :: r -> m a }

instance Functor m => Functor (ReaderT r m) where
  fmap f rT = ReaderT $ (fmap . fmap) f $ runReaderT rT

instance Applicative m => Applicative (ReaderT r m) where
  pure :: a -> (ReaderT r m) a
  pure a = ReaderT $ pure . pure a
  (<*>) (ReaderT mrf) (ReaderT mra) = ReaderT $ (liftA2 (<*>)) mrf mra

instance Monad m => Monad (ReaderT r m) where
  (>>=) :: (ReaderT r m) a -> (a -> (ReaderT r m) b) -> (ReaderT r m) b
  (>>=) (ReaderT mra) atrTmrb = ReaderT $ \ r -> (mra r) >>= (\ a -> runReaderT (atrTmrb a) r)

instance MonadTrans (ReaderT r) where
  lift :: Functor m => m a -> ReaderT r m a
  lift ma = ReaderT $ pure ma

instance (MonadIO m) => MonadIO (ReaderT r m) where
  liftIO :: IO a -> ReaderT r m a
  liftIO = lift . liftIO

\end{code}

\begin{code}
main :: IO ()
main = putStrLn "a"
\end{code}
