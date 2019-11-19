Write the Functor instance for EitherT

\begin{code}
{-# LANGUAGE UnicodeSyntax #-}
{-# LANGUAGE InstanceSigs #-}

module Main where

import Prelude.Unicode

newtype EitherT e m a
  = EitherT { runEitherT ∷ m (Either e a) }

instance Functor m
  ⇒ Functor (EitherT e m)
 where
  fmap ∷ (a → b) → (EitherT e m a) → (EitherT e m b)
  -- Use that m is a Functor, leave the processing of a Functor Either to it
  fmap f = EitherT . ((fmap . fmap) f) . runEitherT
  -- AKA:
  -- fmap f r = EitherT $ (fmap . fmap) f $ runEitherT r

\end{code}
\begin{code}
main ∷ IO ()
main = print "a"
\end{code}
