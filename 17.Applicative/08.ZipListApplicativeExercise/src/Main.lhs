In this exercise we asked to make implementation analogous to the already
existing library code.

So take a notice that we writing a bad crufty code here, even if for learning
purposes.

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


take' ∷ Int → List a → List a
take' n list = go n list Nil
  where
    go 0 _ res = res
    go _ Nil res = res
    go n (Cons a as) res = go (n-1) as (Cons a res)


\end{code}
What is ZipList?
https://hackage.haskell.org/package/base-4.12.0.0/docs/Control-Applicative.html#t:ZipList
```
  newtype ZipList a
  Lists, but with an Applicative functor based on zipping.
```

It is a type:
newtype ZipList a = ZipList [a]
that for monoidal operations uses monoid properties of 'a' inside the [].
Or, as it is said in the book:
ZipList [1, 2, 3] <> ZipList [4, 5, 6]
-- changes to
[
1 <> 4
, 2 <> 5
, 3 <> 6
]

So ZipList monoid reacts to Applicative monoidal nature in a distinct manner.

It is also hinted in the book. Watch-out for the difference Identity and Zero.
And:
```
instance Monoid a => Monoid (ZipList a) where
mempty = pure mempty
mappend = liftA2 mappend

Use this information to implement all this into ZipList'
````

\begin{code}

newtype ZipList' a = ZipList' (List a)
  deriving (Eq, Show, Arbitrary)

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

\end{code}

Well, here you meet an alian form of life.
Due to us changing the rules of the game.
Applicative Identity law states:
```
pure id <*> x ≡ x
```
That means that:
pure id <*> (ZipList' (Cons "\1012390\1098239" (Cons "" Nil)))
 = ZipList' (Cons "\1012390\1098239" (Cons "" Nil))

Solution to the Applicative implemented using the `go` pattern,
which become here vital to us.
\begin{code}

instance Applicative ZipList' where
  pure ∷ a → ZipList' a
  pure a = ZipList' (go a)
    where
      go a = Cons a (go a)

\end{code}

ZipList' is essentially a special [].

What <*> should do in it?
go:
  [] <*> _ = []
  _ <*> [] = []
  f:fs <*> a:as = (f a):(go fs as)
\begin{code}
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
