\begin{code}
{-# LANGUAGE UnicodeSyntax #-}
{-# LANGUAGE FlexibleInstances #-}

module Main where

import Prelude.Unicode

import Test.QuickCheck
import Test.QuickCheck.Property.Common (eq)
import Test.QuickCheck.Property.Functor
import Test.QuickCheck.Property.Common.Internal (Equal)

newtype K a b
  = K a
  deriving (Eq, Show)

instance Arbitrary a ⇒ Arbitrary (K a b) where
  arbitrary = do
    a ← arbitrary
    return (K a)

newtype Flip f a b
  = Flip (f b a)
  deriving (Eq, Show)

\end{code}

If you want to solve this yourself - sit with pen and paper and try to solve
the types and implementation.

Further is spoiler.




1)
Let:

fmap :: Functor f => (a -> b) -> f a -> f b

then:

newtype KT cT d
  = KC cC

newtype FlipT gT eT hT
  = FlipC (gC hC eC)

2) We requested to make instance for "Functor (FlipT KT eT)"
f ≡ (FlipC KT eT)
gT ≡ KT

Which makes:
fmap ∷ (a → b) → (Flip KT eT) a → (Flip KT eT) b

3)
Let cC ≡ 'c' ⇒ cT ≡ Char

KC 'c' ∷ KT Char d

d - was never supplied type or initialized,
constructor does not exist.

Lets undefined ≡ ⊥
Lets d ≡ ⊥ and it is value is ⊥

Now lets set according FlipC with (KC 'c' ⊥)

FlipC (KC 'c' ⊥) ∷ Flip KT ⊥ Char

Now: gC ≡ KC, hC ≡ cC ≡ 'c', eC ≡ ⊥, gT ≡ KT still, hT ≡ cT ≡ Char, eT ≡ d

4) Now in:
fmap ∷ (a → b) → (FlipT KT eT) a → (FlipT KT eT) b

eT ≡ d ≡ ⊥

fmap ∷ (a → b) → (FlipT KT ⊥) a → (FlipT KT ⊥) b

5)
There seems nothing to reduce in types.
Let's try to build this Functor.

Let's use Int as alias for ⊥ type:
:k (Flip K Int)
(Flip K Int) :: * -> *

f ≡ (Flip K ⊥) :: * -> *

In Functor (a → b) operates on a:
FlipC (KC cC ⊥) ∷ Flip KT ⊥ cT

, this proves that a ≡ cT

fmap ∷ (cT → b) → (FlipT KT ⊥) cT → (FlipT KT ⊥) b
fmap fC (FlipC (KC cC)) = Flip (KC (fC b))
\begin{code}
instance Functor (Flip K void) where
  fmap f (Flip (K a)) = Flip (K (f a))

instance Arbitrary b ⇒ Arbitrary (Flip K a b) where
  arbitrary = do
    b ← arbitrary
    return (Flip (K b))

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
  quickCheck $ eq $ (prop_AutoFunctorId ∷ Prop_AutoFunctorId (Flip K Bool) Integer)
  quickCheck $ eq $ (prop_AutoFunctorId ∷ Prop_AutoFunctorId (Flip K Bool) (Either Bool String))
  quickCheck $ eq $ (prop_AutoFunctorCompose ∷ Prop_AutoFunctorCompose (Flip K Bool) String Integer String)
  quickCheck $ eq $ (prop_AutoFunctorCompose ∷ Prop_AutoFunctorCompose (Flip K Bool) Integer String (Maybe Int))
\end{code}
