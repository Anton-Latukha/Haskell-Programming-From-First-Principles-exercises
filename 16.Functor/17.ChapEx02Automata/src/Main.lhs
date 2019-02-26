\begin{code}
{-# LANGUAGE UnicodeSyntax #-}
{-# LANGUAGE DeriveFunctor #-}

module Main where

import Prelude.Unicode

import Test.QuickCheck
import Test.QuickCheck.Property.Common (eq)
import Test.QuickCheck.Property.Functor
import Test.QuickCheck.Property.Common.Internal (Equal)

data K a b = K a
  deriving (Eq, Show, Functor)

instance Arbitrary a ⇒ Arbitrary (K a b) where
  arbitrary = do
    a ← arbitrary
    return (K a)

prop_AutoFunctorId ∷ Functor f ⇒ f a → Equal (f a)
prop_AutoFunctorId = prop_FunctorId T

type Prop_AutoFunctorId f a
  = f a
  → Equal (f a)

prop_AutoFunctorCompose ∷ Functor f ⇒ Fun a1 a2 → Fun a2 c → f a1 → Equal (f c)
prop_AutoFunctorCompose f1 f2 = prop_FunctorCompose (applyFun f1) (applyFun f2) T

type Prop_AutoFunctorCompose structureType origType midType resultType
  = Fun origType midType
  → Fun midType resultType
  → structureType origType
  → Equal (structureType resultType)

main ∷ IO ()
main = do
  quickCheck $ eq $ (prop_AutoFunctorId ∷ Prop_AutoFunctorId (K Bool) Integer)
  quickCheck $ eq $ (prop_AutoFunctorId ∷ Prop_AutoFunctorId (K Bool) (Either Bool String))
  quickCheck $ eq $ (prop_AutoFunctorCompose ∷ Prop_AutoFunctorCompose (K Bool) String Integer String)
  quickCheck $ eq $ (prop_AutoFunctorCompose ∷ Prop_AutoFunctorCompose (K Bool) Integer String (Maybe Int))
\end{code}
