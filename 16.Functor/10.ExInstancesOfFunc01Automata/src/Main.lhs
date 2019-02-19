\begin{code}
{-# LANGUAGE UnicodeSyntax #-}
{-# LANGUAGE GeneralizedNewtypeDeriving #-}

module Main where

import Prelude.Unicode

import Test.QuickCheck
import Test.QuickCheck.Function
import Test.QuickCheck.Property.Common
import Test.QuickCheck.Property.Functor
import Test.QuickCheck.Property.Common.Internal

newtype Identity a = Identity a
  deriving (Arbitrary, Eq, Show)

instance Functor Identity where
  fmap f (Identity a) = Identity (f a)

\end{code}

Here we abstract over Test.QuickCheck.Property.Functor library function `prop_FunctorCompose` using wrapper to bind types, and a type alias.
\begin{code}
prop_AutoFunctorCompose ∷ Functor f ⇒ Fun a1 a2 → Fun a2 c → f a1 → Equal (f c)
prop_AutoFunctorCompose f1 f2 = prop_FunctorCompose (applyFun f1) (applyFun f2) T

type Prop_AutoFunctorCompose structureType origType midType resultType
  = Fun origType midType
  → Fun midType resultType
  → structureType origType
  → Equal (structureType resultType)


\end{code}

And Functor ID law.
\begin{code}

prop_AutoFunctorId ∷ Functor f ⇒ f a → Equal (f a)
prop_AutoFunctorId = prop_FunctorId T

type Prop_AutoFunctorId f a
  = f a
  → Equal (f a)

\end{code}

Now QuickCheck would do everything for us.
\begin{code}
main = do
  quickCheck $ eq $ (prop_AutoFunctorId ∷ Prop_AutoFunctorId Identity Integer)
  quickCheck $ eq $ (prop_AutoFunctorId ∷ Prop_AutoFunctorId Identity (Either Bool String))
  quickCheck $ eq $ (prop_AutoFunctorCompose ∷ Prop_AutoFunctorCompose Identity String Integer String)
  quickCheck $ eq $ (prop_AutoFunctorCompose ∷ Prop_AutoFunctorCompose Identity Integer String (Maybe Int))
\end{code}
