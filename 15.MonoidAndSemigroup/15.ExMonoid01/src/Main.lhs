\begin{code}
{-# LANGUAGE UnicodeSyntax #-}
{-# LANGUAGE DeriveGeneric #-}


module Main where

import Prelude.Unicode

import Test.QuickCheck

\end{code}
Trivial has instances of Semigroup, Monoid and Arbitrary.
Use a definitions of associaciation, left and right identities.
\begin{code}

data Trivial = Trivial deriving (Eq, Show)

instance Semigroup Trivial where
  (<>) Trivial Trivial = Trivial

instance Monoid Trivial where
  mempty = Trivial

instance Arbitrary Trivial where
  arbitrary = return Trivial

type TrivAssoc = Trivial → Trivial → Trivial → Bool

semigroupAssoc ∷ (Semigroup a, Eq a) ⇒ a → a → a → Bool
semigroupAssoc a b c = (a <> b) <> c ≡ a <> (b <> c)

monoidLeftIdentity ∷ (Monoid a, Eq a) ⇒ a → Bool
monoidLeftIdentity a = mempty <> a ≡ a

monoidRightIdentity ∷ (Monoid a, Eq a) ⇒ a → Bool
monoidRightIdentity a = a <> mempty ≡ a

main ∷ IO ()
main = do
  let sa = semigroupAssoc
      mli = monoidLeftIdentity
      mri = monoidRightIdentity
  quickCheck (sa ∷ TrivAssoc)
  quickCheck (mli ∷ Trivial → Bool)
  quickCheck (mri ∷ Trivial → Bool)
\end{code}
