\begin{code}

{-# LANGUAGE UnicodeSyntax #-}

module Main where

import Prelude.Unicode

import Test.QuickCheck

newtype TCombine t1 t2
  = CCombine { unCombine ∷ (t1 → t2) }

instance Semigroup t2 ⇒ Semigroup (TCombine t1 t2) where
  CCombine f1 <> CCombine f2 = CCombine (\x → f1 x <> f2 x)

\end{code}
Let's define Monoidal properties for current case
  newtype Combine a b = Combine { unCombine :: (a -> b) }

Let's call the id-function as `e`.

Hense by definition the two-sided id function `e`
  must be right and left composable to any other function inside function type.
  And in described function type - fuction input and output types are different.
  So `e` must be such that `e.f` ≡ `f.e` ≡ `f`.
  And in current case that means that
  function `e` must simoultaniously be `a → a` and `b → b`, where `a, b` are any
  types. Which is strictly possible if types `a ≡ b`, and maybe in some
  other cases. But it is impossible in broad given case.

Since there is no id element - this definition of `Combine a b`
  can not be a Monoid.
\begin{code}
instance Monoid t2 ⇒ Monoid (TCombine t1 t2) where
  mempty = CCombine (\x → mempty)

instance Show (TCombine t1 t2) where
  show (CCombine _) = "TCombine <function>"

instance (CoArbitrary t1, Arbitrary t2) ⇒ Arbitrary (TCombine t1 t2) where
  arbitrary = do
    f ← arbitrary
    return $ CCombine f

type TFuncAssoc f c = f → f → f → c → Bool
prop_TCombineFuncAssoc ∷ (Eq b, Semigroup b) ⇒ TFuncAssoc (TCombine a b) a
prop_TCombineFuncAssoc f g h c = unCombine ((f <> g) <> h) c ≡ unCombine (f <> (g <> h)) c

type TFuncLeftId e f c = e → f → c → Bool
prop_funcLeftId ∷ (Monoid a, Eq a) ⇒ e → f → c → Bool
prop_funcLeftId e f c = (e <> f) c ≡ f c

type TFuncRightId f e c = f → e → c → Bool
prop_funcRightId ∷ (Monoid a, Eq a) ⇒ f → e → c → Bool
prop_funcRightId f e c = (f <> e) c ≡ f a


main ∷ IO ()
main = do
  quickCheck  (prop_TCombineFuncAssoc :: TFuncAssoc (TCombine Int String) Int)

\end{code}
