\begin{code}
{-# LANGUAGE UnicodeSyntax  #-}

\end{code}

Pragma enables to write type desctiptions and get more reasonable debugging msgs.
\begin{code}
{-# LANGUAGE InstanceSigs   #-}

module Main where

import Prelude.Unicode
import Test.QuickCheck
import Test.QuickCheck.Checkers
import Test.QuickCheck.Classes

data List t = Nil | Cons t (List t)
  deriving (Eq, Show)

\end{code}

List ~= []
This means it is a Monoidal structure.
It would be convinient to use (<>) in the (<*>).
\begin{code}

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
  
  -- Write a type signature to help yourself
  (<*>) ∷ List (t1 → t2) → List t1 → List t2
  (<*>) _ Nil = Nil
  (<*>) Nil _ = Nil
  -- If reminder of the functions list is Nil → skip the tail recursion.
  (<*>) (Cons f Nil) (Cons a2 b2) = Cons (f a2) (f <$> b2)
  -- But if there is function list → recurse over it.
  (<*>) (Cons f a1) (Cons a2 b2) = Cons (f a2) (f <$> b2) <> (a1 <*> Cons a2 b2)

-- Let's use Checkers lib
-- And use the QuickCheck.Classes that already have properties for standard type classes
-- From Classes we would use: applicative, functor, monoid, semigroup

-- To test the List for according properties with Checkers & QuickCheck -
-- Arbitrary must be implemented.
-- To generate Lists of random length - leveraging QuickCheck possibilities for
-- it. Using `sized` to provide the length of list, and we provide a builder of
-- Lists (genSizedList) to generate them.
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

fold ∷ (a → b → b) → b → List a → b
fold _ b Nil = b
fold f b (Cons h t) = f h (fold f b t)

-- concat' ∷ List (List a) → List a
-- concat' = fold append Nil

-- write this one in terms
-- of concat' and fmap

-- flatMap ∷ (a → List b) → List a → List b
-- flatMap

f = Cons (+1) (Cons (*2) Nil)
v = Cons 1 (Cons 2 Nil)


main ∷ IO ()
main = do
  print (f <*> v)
  quickBatch $ semigroup (undefined ∷ List String)
  quickBatch $ monoid (undefined ∷ List String)
  quickBatch $ functor (undefined (undefined, undefined, undefined) ∷ List (String, String, String))
  quickBatch $ functor (undefined (undefined, undefined, undefined) ∷ List (Integer, Integer, Integer))
  quickBatch $ functor (undefined (undefined, undefined, undefined) ∷ List (Double, String, Bool))
  quickBatch $ applicative (undefined (undefined, undefined, undefined) ∷ List (String, String, String))
  quickBatch $ applicative (undefined (undefined, undefined, undefined) ∷ List (Integer, Integer, Integer))
  quickBatch $ applicative (undefined (undefined, undefined, undefined) ∷ List (Double, String, Bool))

\end{code}
