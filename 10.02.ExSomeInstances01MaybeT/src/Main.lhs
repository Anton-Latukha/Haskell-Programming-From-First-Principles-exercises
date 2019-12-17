\begin{code}
{-# LANGUAGE UnicodeSyntax #-}
{-# LANGUAGE InstanceSigs #-}

import Control.Monad.IO.Class (MonadIO(..))

newtype MaybeT m a = MaybeT { runMaybeT :: m (Maybe a) }

instance Functor m => Functor (MaybeT m) where
  fmap f mT = MaybeT $ (fmap . fmap) f (runMaybeT mT)

instance Applicative m => Applicative (MaybeT m) where
  pure = undefined
  (<*>) = undefined

instance Monad m => Monad (MaybeT m) where
  (>>=) = undefined

instance (MonadIO m) => MonadIO (MaybeT m) where
  liftIO = undefined

\end{code}
\begin{code}

\end{code}
