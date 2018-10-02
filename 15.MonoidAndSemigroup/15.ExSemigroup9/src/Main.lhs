\begin{code}

{-# LANGUAGE UnicodeSyntax #-}

module ModuleName where

import Prelude.Unicode

import Test.QuickCheck
\end{code}

Getting Sum/getSum from Semigroup
\begin{code}
import Data.Semigroup

\end{code}
Function that checks any binary function for associative law.
\begin{code}
newtype TCombine t1 t2
  = CCombine { unCombine ∷ (t1 → t2) }

instance Semigroup t2 ⇒ Semigroup (TCombine t1 t2) where
  CCombine f1 <> CCombine f2 = CCombine (\x → f1 x <> f2 x)

instance Show (TCombine a b) where
  show (CCombine _) = "Combine <function>"

instance (CoArbitrary t1, Arbitrary t2) ⇒ Arbitrary (TCombine t1 t2) where
  arbitrary = do
    f ← arbitrary
    return $ CCombine f

type FunctionAssociativity x c = x → x → x → c -> Bool

semigroupCombineAssociativity :: (Eq b, Semigroup b) ⇒ FunctionAssociativity (TCombine a b) a
semigroupCombineAssociativity f g h c = unCombine ((f <> g) <> h) c ≡ unCombine (f <> (g <> h)) c

main ∷ IO ()
main = do
  --quickCheck (propAssoc ∷ TFuncAssoc String String String)
  (quickCheck . verbose)  (semigroupCombineAssociativity :: FunctionAssociativity (TCombine Int String) Int)
\end{code}
