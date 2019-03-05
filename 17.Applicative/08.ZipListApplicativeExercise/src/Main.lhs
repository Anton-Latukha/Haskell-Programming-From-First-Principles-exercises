\begin{code}
{-# LANGUAGE UnicodeSyntax #-}

{-# LANGUAGE InstanceSigs   #-}
{-# LANGUAGE GeneralizedNewtypeDeriving #-}
{-# LANGUAGE FlexibleContexts #-}
{-# LANGUAGE UndecidableInstances #-}
{-# LANGUAGE StandaloneDeriving #-}

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

take' ∷ Int → List a → List a
take' n list = go n list Nil
  where
    go 0 _ res = res
    go n (Cons a as) res = go (n-1) as (Cons a res)

newtype ZipList' a = ZipList' (List a)
  deriving (Eq, Show)
deriving instance Arbitrary (List a) ⇒ Arbitrary (ZipList' a)

instance Eq a ⇒ EqProp (ZipList' a) where
  xs =-= ys = xs' `eq` ys'
    where
      xs' = let (ZipList' l) = xs
        in take' 3000 l
      ys' = let (ZipList' l) = ys
        in take' 3000 l

instance Functor ZipList' where
  fmap ∷ (a → b) → ZipList' a → ZipList' b
  fmap f (ZipList' as) = ZipList' $ f <$> as

instance Applicative ZipList' where
  pure ∷ a → ZipList' a
  pure as = ZipList' (Cons as Nil)

  (<*>) ∷ ZipList' (a → b) → ZipList' a → ZipList' b
  (<*>) (ZipList' (Cons f fs)) (ZipList' (Cons a as)) = ZipList' (Cons (f a) (fs <*> as))

main ∷ IO ()
main = do
  quickBatch $ applicative (undefined (undefined, undefined, undefined) ∷ ZipList' (String, String, String))
  quickBatch $ applicative (undefined (undefined, undefined, undefined) ∷ ZipList' (Integer, Integer, Integer))
  quickBatch $ applicative (undefined (undefined, undefined, undefined) ∷ ZipList' (Double, String, Bool))
\end{code}
\begin{code}

-- main ∷ IO ()
-- main = print "a"
\end{code}
