\begin{code}
{-# LANGUAGE UnicodeSyntax #-}

module Main where

import Prelude.Unicode

\end{code}

This code would use prior work from exercises 10.InstancesOfFunc0[1..7]Automata,
it uses automated property testing.
\begin{code}

import Test.QuickCheck
import Test.QuickCheck.Property.Common (eq)
import Test.QuickCheck.Property.Functor
import Test.QuickCheck.Property.Common.Internal (Equal)

data Quant a b
  = Finance
  | Desk a
  | Bloor b
  deriving (Eq, Show)

instance Functor (Quant a) where
  fmap f (Bloor b) = Bloor (f b)
  fmap _ (Desk a)  = Desk a
  fmap _ Finance   = Finance

instance (Arbitrary a, Arbitrary b) ⇒ Arbitrary (Quant a b) where
  arbitrary = do
    a ← arbitrary
    b ← arbitrary
    oneof (fmap return [Finance, Desk a, Bloor b])

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
  quickCheck $ eq $ (prop_AutoFunctorId ∷ Prop_AutoFunctorId (Quant ()) Integer)
  quickCheck $ eq $ (prop_AutoFunctorId ∷ Prop_AutoFunctorId (Quant ()) (Either Bool String))
  quickCheck $ eq $ (prop_AutoFunctorCompose ∷ Prop_AutoFunctorCompose (Quant ()) String Integer String)
  quickCheck $ eq $ (prop_AutoFunctorCompose ∷ Prop_AutoFunctorCompose (Quant ()) Integer String (Maybe Int))
\end{code}
