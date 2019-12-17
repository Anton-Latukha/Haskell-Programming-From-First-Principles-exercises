\begin{code}
{-# LANGUAGE UnicodeSyntax #-}
{-# LANGUAGE InstanceSigs #-}
{-# LANGUAGE LambdaCase #-}

import Control.Monad.IO.Class (MonadIO(..))
import Control.Applicative (liftA2)

newtype MaybeT m a = MaybeT { runMaybeT :: m (Maybe a) }

instance Functor m => Functor (MaybeT m) where
  fmap f mT = MaybeT $ (fmap . fmap) f (runMaybeT mT)

instance Applicative m => Applicative (MaybeT m) where
  pure = MaybeT . pure . pure
  (<*>) mTmmf mTmma = MaybeT $ (liftA2 (<*>)) (runMaybeT mTmmf) (runMaybeT mTmma)

instance Monad m => Monad (MaybeT m) where
  (>>=) :: (MaybeT m) a -> (a -> (MaybeT m) b) -> (MaybeT m) b
  (>>=) mTmMaya atMTmMayb = MaybeT $ (runMaybeT mTmMaya) >>= \case
    Nothing -> pure Nothing
    Just a -> runMaybeT (atMTmMayb a)

instance (MonadIO m) => MonadIO (MaybeT m) where
  liftIO = undefined

\end{code}
\begin{code}

\end{code}
