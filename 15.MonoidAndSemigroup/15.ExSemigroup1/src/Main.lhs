\begin{code}
{-# LANGUAGE UnicodeSyntax #-}
module ModuleName where

import Prelude.Unicode

import Test.QuickCheck

data Trivial = Trivial deriving (Eq, Show)

instance Semigroup Trivial where
  _ <> _ = Trivial

\end{code}
Returns Gen Trivial (Trivial inside Gen monad)
\begin{code}
instance Arbitrary Trivial where
  arbitrary = return Trivial

\end{code}
Fucntion that checks any binary function for associative law.
\begin{code}
assocCheck ∷ (Eq m) ⇒ (m → m → m) → m → m → m → Bool
assocCheck f a b c = (f a (f b c)) ≡ (f (f a b) c)

type TrivAssoc
  = (Trivial → Trivial → Trivial)
  → Trivial
  → Trivial
  → Trivial
  → Bool

main ∷ IO ()
main = do
  quickCheck ((assocCheck ∷ TrivAssoc) (<>))
\end{code}
