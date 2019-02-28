\begin{code}
{-# LANGUAGE UnicodeSyntax #-}

module Main where

import Prelude.Unicode

import Test.QuickCheck
import Test.QuickCheck.Property.Common (eq)
import Test.QuickCheck.Property.Functor
import Test.QuickCheck.Property.Common.Internal (Equal)
import GHC.Generics

data Parappa f g a
  = DaWrappa (f a) (g a)
  deriving (Eq, Show)

-- instance (CoArbitrary a, Arbitrary a, Arbitrary b, Arbitrary c) ⇒ Arbitrary (Parappa (a → b) (a → c) a) where
--   arbitrary = do
--     a ← arbitrary
--     b ← promote (\x -> coarbitrary x arbitrary)
--     c ← promote (\x -> coarbitrary x arbitrary)
--     return (DaWrappa (b a) (c a))

instance (Functor f, Functor g) ⇒ Functor (Parappa f g) where
  fmap f (DaWrappa (fa) (ga)) = DaWrappa (fmap f fa) (fmap f ga)

data Type f g a
  = Type f g a

-- instance (CoArbitrary f, Arbitrary f, CoArbitrary g, Arbitrary g, Arbitrary a) ⇒ Arbitrary (Type f g a) where
--   arbitrary = do
--     f ← promote (\x -> coarbitrary x arbitrary)
--     g ← promote (\x -> coarbitrary x arbitrary)
--     a ← arbitrary
--     return (Type f g a)

instance Arbitrary (Type f g a) where
  arbitrary = do
    f ← arbitrary
    g ← arbitrary
    a ← arbitrary
    return (Type f g a)

-- main = 
\end{code}
