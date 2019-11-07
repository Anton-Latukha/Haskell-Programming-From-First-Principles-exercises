\begin{code}
{-# LANGUAGE UnicodeSyntax #-}
{-# LANGUAGE InstanceSigs #-}

module Twinplicative where

import Prelude.Unicode
import Test.QuickCheck
import Test.QuickCheck.Checkers
import Test.QuickCheck.Classes

newtype Compose f g a
  = Compose { getCompose :: f (g a) }
  deriving (Eq, Show)

instance (Applicative f, Applicative g) ⇒ Applicative (Compose f g)
 where
  pure ∷ a → Compose f g a
  pure = f $ g

  (<*>) ∷ Compose f g (a → b)
       → Compose f g a
       → Compose f g a
  (Compose f) <*> (Compose a) = Compose (f a)

\end{code}
\begin{code}
main ∷ IO ()
main = quichBatch $ applicative (Compose [Just "string"])
\end{code}
