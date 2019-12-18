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
  (<*>) rTmmf rTmma = ReaderT $ (liftA2 (<*>)) (runReaderT rTmmf) (runReaderT rTmma)


\end{code}

\begin{code}
main :: IO ()
main = putStrLn "a"
\end{code}
