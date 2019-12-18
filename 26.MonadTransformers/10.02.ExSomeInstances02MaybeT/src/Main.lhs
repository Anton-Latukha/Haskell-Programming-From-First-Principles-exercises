\begin{code}
{-# LANGUAGE UnicodeSyntax #-}
{-# LANGUAGE InstanceSigs #-}
{-# LANGUAGE LambdaCase #-}

import Control.Monad.IO.Class (MonadIO(..))
import Control.Applicative (liftA2)
import Control.Monad.Trans

newtype MaybeT m a = MaybeT { runMaybeT :: m (Maybe a) }
newtype ReaderT r m a = ReaderT { runReaderT :: r -> m a }

instance Functor m => Functor (ReaderT r m) where
  fmap f rT = ReaderT $ (fmap . fmap) f $ runReaderT rT

instance Applicative m => Applicative (ReaderT r m) where
  pure :: a -> (ReaderT r m) a
  pure a = ReaderT $ pure . pure a
  (<*>) (ReaderT mrf) (ReaderT mra) = ReaderT $ (liftA2 (<*>)) mrf mra

instance Monad m => Monad (ReaderT r m) where
  (>>=) :: (ReaderT r m) a -> (a -> (ReaderT r m) b) -> (ReaderT r m) b
  (>>=) (ReaderT mra) atrTmrb = ReaderT $ undefined


\end{code}

\begin{code}
main :: IO ()
main = putStrLn "a"
\end{code}
