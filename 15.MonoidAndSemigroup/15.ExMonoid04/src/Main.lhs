\begin{code}

{-# LANGUAGE UnicodeSyntax #-}

module Main where

import Prelude.Unicode

import Test.QuickCheck

newtype BoolConj = BoolConj Bool
  deriving (Eq, Show)

instance Semigroup BoolConj where
  (<>) (BoolConj a) (BoolConj b) = BoolConj (a ∧ b)

\end{code}
What velue would make an Id element with ∧ of Bool.
\begin{code}
instance Monoid BoolConj where
  mempty = BoolConj True

instance Arbitrary BoolConj where
  arbitrary = do
    a ← arbitrary
    return $ BoolConj a

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

type BoolConjAssoc
  = (BoolConj → BoolConj → BoolConj)
  → BoolConj
  → BoolConj
  → BoolConj
  → Bool

type BoolConjSideId
  = (BoolConj → BoolConj → BoolConj)
  → BoolConj
  → BoolConj
  → Bool


main ∷ IO ()
main = do
  quickCheck ((propAssoc ∷ BoolConjAssoc) (<>))
  quickCheck ((prop_leftId ∷ BoolConjSideId) (<>) mempty)
  quickCheck (flip ((prop_rightId ∷ BoolConjSideId) (<>)) mempty )

\end{code}
