\begin{code}

{-# LANGUAGE UnicodeSyntax #-}

module Main where

import Prelude.Unicode

import Test.QuickCheck

\end{code}
Function that checks any binary function for associative law.
\begin{code}
newtype TCombine t1 t2
  = CCombine { unCombine ∷ (t1 → t2) }

instance Semigroup t2 ⇒ Semigroup (TCombine t1 t2) where
  CCombine f1 <> CCombine f2 = CCombine (\x → f1 x <> f2 x)

instance Show (TCombine t1 t2) where
  show (CCombine _) = "TCombine <function>"

instance (CoArbitrary t1, Arbitrary t2) ⇒ Arbitrary (TCombine t1 t2) where
  arbitrary = do
    f ← arbitrary
    return $ CCombine f

type TFuncAssoc f c = f → f → f → c → Bool
prop_TCombineFuncAssoc ∷ (Eq b, Semigroup b) ⇒ TFuncAssoc (TCombine a b) a
prop_TCombineFuncAssoc f g h c = unCombine ((f <> g) <> h) c ≡ unCombine (f <> (g <> h)) c


main ∷ IO ()
main = do
  quickCheck  (prop_TCombineFuncAssoc :: TFuncAssoc (TCombine Int String) Int)
\end{code}
