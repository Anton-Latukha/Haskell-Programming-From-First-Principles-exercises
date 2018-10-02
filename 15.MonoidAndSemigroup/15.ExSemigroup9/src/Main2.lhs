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
prop_FuncAssoc ∷ (Eq m) ⇒ TFunc t1 t2 → TFunc t2 t3 → TFunc t3 t4 → i → Bool
prop_FuncAssoc a b c i = (a <> (b <> c)) i ≡ ((a <> b) <> c) i

newtype TFunc t1 t2 = CFunc (t1 → t2)
  deriving (Eq)

newtype TCombine t1 t2
  = CCombine { unCombine ∷ TFunc t1 t2 }

--instance Semigroup t2 ⇒ Semigroup (TCombine t1 t2) where
--  CCombine f1 <> CCombine f2 = CCombine (\x → f1 x <> f2 x)

--instance Show (TCombine a b) where
--  show (CCombine _) = "Combine <function>"

--instance (CoArbitrary t1, Arbitrary t2) ⇒ Arbitrary (TCombine t1 t2) where
--  arbitrary = do
--    f ← arbitrary
--    return $ CCombine f

--main ∷ IO ()
--main = do
  --quickCheck (propAssoc ∷ TFuncAssoc String String String)
  --(quickCheck . verbose)  ((propAssoc :: TFuncAssoc (TCombine Integer Integer) Integer Integer) (<>))
\end{code}
