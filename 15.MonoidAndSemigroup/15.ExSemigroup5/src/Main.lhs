\begin{code}

{-# LANGUAGE UnicodeSyntax #-}

module ModuleName where

import Prelude.Unicode

import Test.QuickCheck

\end{code}
Function that checks any binary function for associative law.
\begin{code}
propAssoc ∷ (Eq m) ⇒ (m → m → m) → m → m → m → Bool
propAssoc f a b c = (f a (f b c)) ≡ (f (f a b) c)

data Four t1 t2 t3 t4 = Four t1 t2 t3 t4
  deriving (Eq, Show)

instance (Semigroup t1, Semigroup t2, Semigroup t3, Semigroup t4) ⇒ Semigroup (Four t1 t2 t3 t4) where
  (<>) (Four a1 b1 c1 d1) (Four a2 b2 c2 d2) = Four (a1 <> a2) (b1 <> b2) (c1 <> c2) (d1 <> d2)

instance (Arbitrary t1, Arbitrary t2, Arbitrary t3, Arbitrary t4) ⇒ Arbitrary (Four t1 t2 t3 t4) where
  arbitrary = do
  a ← arbitrary
  b ← arbitrary
  c ← arbitrary
  d ← arbitrary
  return (Four a b c d)

type FourAssoc t1 t2 t3 t4
  = (Four t1 t2 t3 t4 → Four t1 t2 t3 t4 → Four t1 t2 t3 t4)
  → Four t1 t2 t3 t4
  → Four t1 t2 t3 t4
  → Four t1 t2 t3 t4
  → Bool

main ∷ IO ()
main = do
  quickCheck ((propAssoc ∷ FourAssoc String String String String) (<>))
\end{code}
