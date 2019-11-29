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

instance
  Monad m
  ⇒ Applicative (EitherT e m)
 where
  pure ∷ a → EitherT e m a
  pure = EitherT . pure . Right
  (<*>) ∷ EitherT e m (a → b) → EitherT e m a → EitherT e m b
  (<*>) (EitherT mEf) (EitherT mEa) =
    EitherT $ (>>=) mEa $ \case
      Right a -> (>>=) mEf $ \case
        Right f → pure $ Right $ f a
        Left f → pure $ Left f
      Left a → pure $ Left a

instance Monad m => Monad (EitherT e m) where
  (>>=) ∷ EitherT e m a → (a → EitherT e m b) → EitherT e m b
  (>>=) (EitherT mEa) k  = EitherT $ do
    ea <- mEa
    case ea of
      Left  l -> return (Left l)
      Right r -> runEitherT (k r)

\end{code}
\begin{code}
main ∷ IO ()
main = putStrLn "a"
\end{code}
