\begin{code}
{-# LANGUAGE UnicodeSyntax #-}

module Main where

import Prelude.Unicode

import Test.QuickCheck
import Test.QuickCheck.Property.Common (eq)
import Test.QuickCheck.Property.Functor
import Test.QuickCheck.Property.Common.Internal (Equal)

data LiftItOut f a = LiftItOut (f a)
  deriving (Eq, Show)

\end{code}

LiftItOut ∷ (* -> *) -> * -> *
LiftItOut f ∷ * → *

fmap :: Functor f => (a -> b) -> f a -> f b

f ≡ (LiftItOut f)
\begin{code}
instance Functor f ⇒ Functor (LiftItOut f) where
  fmap f (LiftItOut (fa)) = LiftItOut (fmap f (fa))

instance (Arbitrary (f a)) ⇒ Arbitrary (LiftItOut f a) where
  arbitrary = do
    fa ← arbitrary
    return (LiftItOut (fa))

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
  quickCheck $ eq $ (prop_AutoFunctorId ∷ Prop_AutoFunctorId (LiftItOut Maybe) Integer)
  quickCheck $ eq $ (prop_AutoFunctorId ∷ Prop_AutoFunctorId (LiftItOut Maybe) (Either Bool String))
  quickCheck $ eq $ (prop_AutoFunctorCompose ∷ Prop_AutoFunctorCompose (LiftItOut Maybe) String Integer String)
  quickCheck $ eq $ (prop_AutoFunctorCompose ∷ Prop_AutoFunctorCompose (LiftItOut Maybe) Integer String (Maybe Int))
\end{code}
