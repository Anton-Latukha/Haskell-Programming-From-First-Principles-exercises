\begin{code}
{-# LANGUAGE UnicodeSyntax #-}

module Main where

import Prelude.Unicode


\end{code}

fmap  ∷  (a → b) → f a → f b
fmap  ∷  (a → b) → Id a → Id b
pure  ∷  a →  f a
pure  ∷  a → Id a
(<*>) ∷  f (a → b) →  f a →  f b
(<*>) ∷ Id (a → b) → Id a → Id b

\begin{code}

newtype Identity a = Identity a
  deriving (Eq, Ord, Show)

instance Functor Identity where
  fmap f (Identity a) = Identity $ f a

instance Applicative Identity where
   pure = Identity
   (<*>) (Identity f) ida = fmap f ida

xs = [1, 2, 3]
xs' = [9, 9, 9]
mkId = Identity

main ∷ IO ()
main = print $ const <$> mkId xs <*> mkId xs'
\end{code}
