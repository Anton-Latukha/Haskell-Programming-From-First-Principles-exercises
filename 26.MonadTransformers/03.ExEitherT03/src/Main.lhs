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

instance
  Monad m
  ⇒ Monad (EitherT e m)
 where
  (>>=) ∷ EitherT e m a → (a → EitherT e m b) → EitherT e m b
  (>>=) (EitherT mEa) atTmEb = join (fmap atTmEb $ EitherT mEa)
   where
    join :: EitherT e m (EitherT e m b) -> EitherT e m b
    join (EitherT m1e1eitherTm2e2a) = go m1e1eitherTm2e2a
      where
      go m1 e1 (eitherTm2e2a) = goL m1 e1 (runEitherT eitherTm2e2a)
       where
        goL m1 e1 m2 e2a = goLL m1 e1 m2 e2a
         where
          goLL m1 e1 m2 (e2 a) = EitherT $ m1 <> m2 $ e1 <> e2 $ a
  -- (>>=) (EitherT mEa) atTmEb = EitherT $ (>>=) mEa $ \case
  --   Right a -> runEitherT $ atTmEb a
  --   Left a -> pure $ Left a

\end{code}
\begin{code}
main ∷ IO ()
main = putStrLn "a"
\end{code}
