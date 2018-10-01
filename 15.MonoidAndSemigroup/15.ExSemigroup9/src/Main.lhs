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
propAssoc ∷ (Eq m) ⇒ (m → m → m) → m → m → m → Bool
propAssoc f a b c = (f a (f b c)) ≡ (f (f a b) c)

newtype TCombine t1 t2
  = CCombine { unCombine ∷ (t1 → t2) }

type TFuncAssoc t1 t2 t3
  = (Fun t1 t2 → Fun t2 t3 → Fun t1 t3)
  → Fun t1 t2
  → Fun t2 t3
  → Fun t1 t3
  → Bool

main ∷ IO ()
main = do
  quickCheck (propAssoc ∷ TFuncAssoc String String String)

\end{code}
