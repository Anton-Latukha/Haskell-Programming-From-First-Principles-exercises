\begin{code}
{-# LANGUAGE UnicodeSyntax #-}

module BadMonad where

import Prelude.Unicode

import Test.QuickCheck
import Test.QuickCheck.Classes
import Test.QuickCheck.Checkers

data CountMe a = CountMe Integer a
  deriving (Eq, Show)

instance Functor CountMe where
  fmap f (CountMe i a) = CountMe (i + 1) (f a)

instance Applicative CountMe where
  pure = CountMe 0
  CountMe n f <*> CountMe _ a = CountMe (n + 1) (f a)

instance Monad CountMe where
  return = pure
  CountMe n a >>= f =
    let
      CountMe _ b = f a
    in
      CountMe (n + 1) b

instance Arbitrary a ⇒ Arbitrary (CountMe a) where
  arbitrary = CountMe <$> arbitrary <*> arbitrary

instance Eq a ⇒ EqProp (CountMe a) where
  (=-=) = eq

u = undefined

type S = String
type I = Integer
type B = Bool
type CountMe3 a = CountMe (a, a, a)

quickie ∷ t → (t → TestBatch) → IO ()
quickie t f = quickBatch $ f u

main ∷ IO ()
main = do
  -- quickie (u ∷ CountMe3 S) semigroup
  -- quickie (u ∷ CountMe3 I) semigroup
  -- quickie (u ∷ CountMe3 B) semigroup
  quickie (u ∷ CountMe3 S) functor
  quickie (u ∷ CountMe3 I) functor
  quickie (u ∷ CountMe3 B) functor
  quickie (u ∷ CountMe3 S) applicative
  quickie (u ∷ CountMe3 I) applicative
  quickie (u ∷ CountMe3 B) applicative
  quickie (u ∷ CountMe3 S) monad
  quickie (u ∷ CountMe3 I) monad
  quickie (u ∷ CountMe3 B) monad
\end{code}
