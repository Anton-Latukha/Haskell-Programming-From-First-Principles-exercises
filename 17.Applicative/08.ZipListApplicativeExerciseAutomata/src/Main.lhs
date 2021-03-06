Sorry book assignment. Here we seems to make a smarter move - and not reinvent
the Applicative and all that it is needs, and since ZipList' is just a wrapper
around List - we let GHC derive all instances from List.

\begin{code}
{-# LANGUAGE UnicodeSyntax #-}

{-# LANGUAGE InstanceSigs   #-}
{-# LANGUAGE GeneralizedNewtypeDeriving #-}

module Main where

import Prelude.Unicode
import Test.QuickCheck
import Test.QuickCheck.Classes
import Test.QuickCheck.Checkers


data List t = Nil | Cons t (List t)
  deriving (Eq, Show)

instance Semigroup (List a) where
  (<>) ∷ List a → List a → List a
  (<>) a Nil = a
  (<>) Nil a = a
  (<>) (Cons a1 b1) a2 = Cons a1 $ b1 <> a2

instance Monoid (List a) where
  mempty = Nil

instance Functor List where
  fmap ∷ (a → b) → List a → List b
  fmap f Nil = Nil
  fmap f (Cons x a) = Cons (f x) $ fmap f a

instance Applicative List where
  pure x = Cons x Nil

  (<*>) ∷ List (t1 → t2) → List t1 → List t2
  (<*>) _ Nil = Nil
  (<*>) Nil _ = Nil
  (<*>) (Cons f Nil) (Cons a2 b2) = Cons (f a2) (f <$> b2)
  (<*>) (Cons f a1) (Cons a2 b2) = Cons (f a2) (f <$> b2) <> (a1 <*> Cons a2 b2)

instance (Arbitrary t) ⇒ Arbitrary (List t) where
  arbitrary = sized genSizedList
    where
      genSizedList ∷ (Arbitrary t) ⇒ Int → Gen (List t)
      genSizedList n =
        if n ≤ 0
        then return Nil
        else Cons <$> arbitrary <*> genSizedList (n - 1)

instance Eq a ⇒ EqProp (List a) where
  (=-=) = eq


newtype ZipList' a = ZipList' (List a)
  deriving (Eq, EqProp, Show, Arbitrary, Semigroup, Monoid, Functor, Applicative)

main ∷ IO ()
main = do
  quickBatch $ applicative (undefined (undefined, undefined, undefined) ∷ ZipList' (String, String, String))
  quickBatch $ applicative (undefined (undefined, undefined, undefined) ∷ ZipList' (Integer, Integer, Integer))
  quickBatch $ applicative (undefined (undefined, undefined, undefined) ∷ ZipList' (Double, String, Bool))
\end{code}
