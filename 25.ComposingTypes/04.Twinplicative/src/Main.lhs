\begin{code}
{-# LANGUAGE UnicodeSyntax #-}
{-# LANGUAGE InstanceSigs #-}

module Twinplicative where

import Prelude.Unicode
import Test.QuickCheck
import Test.QuickCheck.Checkers
import Test.QuickCheck.Classes
import Control.Applicative

newtype Compose f g a
  = Compose { getCompose :: f (g a) }
  deriving (Eq, Show)

instance (Functor f, Functor g)
  => Functor (Compose f g)
 where
  fmap f (Compose fga)
    = Compose $ (fmap . fmap) f fga

instance (Applicative f, Applicative g)
  ⇒ Applicative (Compose f g)
 where
  pure ∷ a → Compose f g a
  pure a = Compose (pure (pure a))

  (<*>) ∷ Compose f g (a → b)
       → Compose f g a
       → Compose f g b
  (Compose f) <*> (Compose a) = Compose (liftA2 (<*>) f a)

instance (
  Arbitrary f
  , Arbitrary g, CoArbitrary g
  , Arbitrary a, CoArbitrary a
  )
  ⇒ Arbitrary (Compose f g a)
 where
  arbitrary = do
    a ← arbitrary
    g ← coarbitrary a
    f ← coarfitrary g
    pure Compose f g a

\end{code}
\begin{code}
main ∷ IO ()
main = quickBatch $ applicative (Compose [Just (1 ∷ Integer, True, "string")])
\end{code}
