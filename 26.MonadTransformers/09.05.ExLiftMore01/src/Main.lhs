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


\end{code}
\begin{code}
main ∷ IO ()
main = print "a"
\end{code}
