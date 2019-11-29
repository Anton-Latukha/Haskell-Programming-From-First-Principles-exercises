Write the Monad instance for EitherT:

TODO: Tasing is in not finished state.
\begin{code}
{-# LANGUAGE UnicodeSyntax #-}
{-# LANGUAGE InstanceSigs #-}
{-# LANGUAGE LambdaCase #-}

module Main where

import Prelude.Unicode
import Control.Monad

newtype EitherT e m a
  = EitherT { runEitherT ∷ m (Either e a) }

instance
  Functor m
  ⇒ Functor (EitherT e m)
 where
  fmap ∷ (a → b) → (EitherT e m a) → (EitherT e m b)
  -- Use that m is a Functor, leave the processing of a Functor Either to it
  fmap f (EitherT mEa) = EitherT $ (fmap . fmap) f mEa

\end{code}
\begin{code}
main ∷ IO ()
main = putStrLn "a"
\end{code}
