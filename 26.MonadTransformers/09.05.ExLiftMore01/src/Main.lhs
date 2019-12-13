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


\end{code}
\begin{code}
main ∷ IO ()
main = print "a"
\end{code}
