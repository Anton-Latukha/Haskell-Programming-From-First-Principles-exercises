\begin{code}
{-# LANGUAGE UnicodeSyntax #-}

module Main where

import Prelude.Unicode

import Data.Semigroup
import Data.Monoid
import Test.QuickCheck
\end{code}

As asked in the assignment - create a new abstraction above Maybe.
\begin{code}
newtype First' a =
  First' { getFirst' ∷ Maybe a }
  deriving (Eq, Show)
\end{code}

Asked instance of First' without using Monoid properties of writing type.
\begin{code}
instance Semigroup (First' a) where
  (<>) (First' Nothing) b = b
  (<>) a (First' Nothing) = a
  (<>) a b                = a
\end{code}

Acompanying Monoidal instance adding Identity value.
\begin{code}
instance Monoid (First' a) where
  mempty = (First' Nothing)
\end{code}

Point arbitrary to generate Maybe to generate test cases.
\begin{code}
instance Arbitrary a => Arbitrary (First' a) where
  arbitrary = fmap First' arbitrary
\end{code}

Create types to point them to Monoidal laws.
\begin{code}
type FirstMappend
  = First' String
  → First' String
  → First' String
  → Bool

type FstId =
  First' String → Bool
\end{code}

Monoidal laws themselfs.
\begin{code}
monoidAssoc ∷ (Eq m, Monoid m) ⇒ m → m → m → Bool
monoidAssoc a b c = (a <> (b <> c)) ≡ ((a <> b) <> c)

monoidLeftIdentity ∷ (Eq m, Monoid m) ⇒ m → Bool
monoidLeftIdentity a = mempty <> a ≡ a

monoidRightIdentity ∷ (Eq m, Monoid m) ⇒ m → Bool
monoidRightIdentity a = (a <> mempty) ≡ a

main ∷ IO ()
main = do
  quickCheck (monoidAssoc ∷ FirstMappend)
  quickCheck (monoidLeftIdentity ∷ FstId)
  quickCheck (monoidRightIdentity ∷ FstId)
\end{code}
