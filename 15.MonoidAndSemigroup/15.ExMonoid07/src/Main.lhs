\begin{code}

{-# LANGUAGE UnicodeSyntax #-}

module Main where

import Prelude.Unicode

import Test.QuickCheck

newtype TComp t1 = CComp { unComp ∷ t1 → t1 }

instance Semigroup (TComp t1) where
  (<>) (CComp f1) (CComp f2) = CComp (f2.f1)

\end{code}
Let's mark id-function as `e`.
If function type is `a → a`.

And `f.e ≡ e.f ≡ f` means that e is function `id`.
\begin{code}
instance Monoid (TComp t1) where
  mempty = CComp id

instance (CoArbitrary t1, Arbitrary t1) ⇒ Arbitrary (TComp t1) where
  arbitrary = do
    a ← arbitrary
    return $ CComp a

instance Show (TComp t1) where
  show (CComp _) = "Comp function"

prop_TCompFuncAssoc ∷ (Eq t1) ⇒ TComp t1 → TComp t1 → TComp t1 → t1 → Bool
prop_TCompFuncAssoc f1 f2 f3 c =
 unComp (f1 <> (f2 <> f3)) c ≡ unComp ((f1 <> f2) <> f3) c

\end{code}
Functions can be isomorphic (equal) but not have
  the same equal expression inside.
  That raises the difficulty of checking left-right identity beyond the scope
  of current knowledge.
  Anyway that was not asked in the task, it was an addition.
\begin{code}

main ∷ IO ()
main = do
  quickCheck (prop_TCompFuncAssoc ∷ TComp Integer → TComp Integer → TComp Integer → Integer → Bool)

\end{code}
