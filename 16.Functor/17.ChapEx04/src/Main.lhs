\begin{code}
{-# LANGUAGE UnicodeSyntax #-}

module Main where

import Prelude.Unicode

import Test.QuickCheck
import Test.QuickCheck.Property.Common (eq)
import Test.QuickCheck.Property.Functor
import Test.QuickCheck.Property.Common.Internal (Equal)

data EvilGoateeConst a b = GoatyConst b
  deriving (Eq, Show)

instance Functor (EvilGoateeConst a) where
  fmap f (GoatyConst b) = GoatyConst (f b)

instance Arbitrary b ⇒ Arbitrary (EvilGoateeConst a b) where
  arbitrary = do
    b ← arbitrary
    return (GoatyConst b)

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
  quickCheck $ eq $ (prop_AutoFunctorId ∷ Prop_AutoFunctorId (EvilGoateeConst Bool) Integer)
  quickCheck $ eq $ (prop_AutoFunctorId ∷ Prop_AutoFunctorId (EvilGoateeConst Bool) (Either Bool String))
  quickCheck $ eq $ (prop_AutoFunctorCompose ∷ Prop_AutoFunctorCompose (EvilGoateeConst Bool) String Integer String)
  quickCheck $ eq $ (prop_AutoFunctorCompose ∷ Prop_AutoFunctorCompose (EvilGoateeConst Bool) Integer String (Maybe Int))
\end{code}
