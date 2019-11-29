Functor instance for ReaderT.

\begin{code}
{-# LANGUAGE UnicodeSyntax #-}

module Main where

import Prelude.Unicode
import Control.Applicative

newtype ReaderT r m a = ReaderT { runReaderT :: r -> m a}

instance Functor m
 => Functor (ReaderT r m)
 where
  fmap f (ReaderT rma) = ReaderT $ (fmap . fmap) f rma

\end{code}
\begin{code}
main ∷ IO ()
main = print "a"
\end{code}
