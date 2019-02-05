\begin{code}

{-# LANGUAGE UnicodeSyntax #-}

module Main where

import Prelude.Unicode

import Test.QuickCheck

newtype BoolDisj = BoolDisj Bool
  deriving (Eq, Show)

instance Semigroup BoolDisj where
  (<>) (BoolDisj a)  (BoolDisj b)  = BoolDisj (a ∨ b)

\end{code}
What velue would make an Id element with ∧ of Bool.
\begin{code}
instance Monoid BoolDisj where
  mempty = BoolDisj False

instance Arbitrary BoolDisj where
  arbitrary = do
    a ← arbitrary
    return $ BoolDisj a

\end{code}
Versatile general functions definitions that check any binary function
  for associative law and left&right identity.
  Good for code reuse.
\begin{code}
propAssoc ∷ (Eq m) ⇒ (m → m → m) → m → m → m → Bool
propAssoc f a b c = (f a (f b c)) ≡ (f (f a b) c)

prop_leftId ∷ (Monoid a, Eq a) ⇒ (a → a → a) → a → a → Bool
prop_leftId f e a = f e a ≡ a

prop_rightId ∷ (Monoid a, Eq a) ⇒ (a → a → a) → a → a → Bool
prop_rightId f a e = f a e ≡ a

type BoolDisjAssoc
  = (BoolDisj → BoolDisj → BoolDisj)
  → BoolDisj
  → BoolDisj
  → BoolDisj
  → Bool

type BoolDisjSideId
  = (BoolDisj → BoolDisj → BoolDisj)
  → BoolDisj
  → BoolDisj
  → Bool

main ∷ IO ()
main = do
  quickCheck ((propAssoc ∷ BoolDisjAssoc) (<>))
  quickCheck ((prop_leftId ∷ BoolDisjSideId) (<>) mempty)
  quickCheck (flip ((prop_rightId ∷ BoolDisjSideId) (<>)) mempty )

\end{code}
