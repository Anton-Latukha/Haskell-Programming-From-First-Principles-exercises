\begin{code}
{-# LANGUAGE UnicodeSyntax #-}
{-# LANGUAGE InstanceSigs #-}
{-# LANGUAGE LambdaCase #-}

module Main where

import Prelude.Unicode

import Control.Monad.Trans
import Control.Monad.Trans.Except

newtype EitherT l m r = EitherT {
  runEitherT :: m (Either l r)
  }

instance Monad m =>
  Functor (EitherT l m)
 where
  fmap :: (a -> b) -> EitherT l m a -> EitherT l m b
  fmap f (EitherT mEa) = EitherT $ (fmap . fmap) f mEa

instance Monad m =>
  Applicative (EitherT l m)
 where
  pure :: a -> EitherT l m a
  pure = EitherT . pure . pure
  (<*>) :: EitherT l m (a -> b) -> EitherT l m a -> EitherT l m b
  (<*>) (EitherT mEf) (EitherT mEa) = EitherT $ mEa >>= (\case
    Right a -> mEf >>= (\case
        Right f -> pure $ pure $ f a
        Left l -> pure $ Left l)
    Left l -> pure $ Left l)

instance Monad m =>
  Monad (EitherT l m)
 where
  (>>=) (EitherT mEa) k = EitherT $ mEa >>= \case
    Right a -> runEitherT $ k a
    Left a -> pure $ Left a

instance MonadTrans (EitherT l)
 where
  lift :: Functor m => m a -> EitherT l m a
  lift ma = EitherT $ fmap (pure) ma

\end{code}
\begin{code}
main ∷ IO ()
main = print "a"
\end{code}
