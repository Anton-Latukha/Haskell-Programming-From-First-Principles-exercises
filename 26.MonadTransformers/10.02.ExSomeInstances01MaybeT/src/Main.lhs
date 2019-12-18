\begin{code}
{-# LANGUAGE UnicodeSyntax #-}
{-# LANGUAGE InstanceSigs #-}
{-# LANGUAGE LambdaCase #-}

import Control.Monad.IO.Class (MonadIO(..))
import Control.Applicative (liftA2)
import Control.Monad.Trans

newtype MaybeT m a = MaybeT { runMaybeT :: m (Maybe a) }

instance Functor m => Functor (MaybeT m) where
  fmap f mT = MaybeT $ (fmap . fmap) f (runMaybeT mT)

instance (Applicative m, Monad m) => Applicative (MaybeT m) where
  pure = lift . pure
  (<*>) mTmmf mTmma = MaybeT $ (liftA2 (<*>)) (runMaybeT mTmmf) (runMaybeT mTmma)

instance Monad m => Monad (MaybeT m) where
  (>>=) :: (MaybeT m) a -> (a -> (MaybeT m) b) -> (MaybeT m) b
  (>>=) mTmMaya atMTmMayb = MaybeT $ (runMaybeT mTmMaya) >>= \case
    Nothing -> pure Nothing
    Just a -> runMaybeT (atMTmMayb a)

instance MonadTrans MaybeT where
  lift :: Functor m => m a -> MaybeT m a
  lift ma = MaybeT $ fmap (pure) ma

instance (MonadIO m) => MonadIO (MaybeT m) where
  liftIO :: IO a -> MaybeT m a
  liftIO ioa = lift $ liftIO ioa

\end{code}

\begin{code}
main :: IO ()
main = putStrLn "a"
\end{code}
