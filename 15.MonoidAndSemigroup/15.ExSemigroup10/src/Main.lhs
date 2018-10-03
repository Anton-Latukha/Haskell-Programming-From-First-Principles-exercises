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
prop_CompAssoc ∷ (Eq t1) ⇒ TComp t1 → TComp t1 → TComp t1 → t1 → Bool
prop_CompAssoc f1 f2 f3 c =
 unComp (f1 <> (f2 <> f3)) c ≡ unComp ((f1 <> f2) <> f3) c

newtype TComp t1 = CComp { unComp ∷ t1 → t1 }

instance Semigroup (TComp t1) where
  (<>) (CComp f1) (CComp f2) = CComp (f2.f1)

instance (CoArbitrary t1, Arbitrary t1) ⇒ Arbitrary (TComp t1) where
  arbitrary = do
    a ← arbitrary
    return $ CComp a

instance Show (TComp t1) where
  show (CComp _) = "Comp function"


main ∷ IO ()
main = do
  quickCheck (prop_CompAssoc ∷ TComp Integer → TComp Integer → TComp Integer → Integer → Bool)
\end{code}
