\begin{code}
{-# LANGUAGE UnicodeSyntax #-}

module Main where

import Prelude.Unicode

import Data.Semigroup


\end{code}

fmap  ∷ (a → b) →   f a →   f b
fmap  ∷ (a → b) → (C e) a → (C e) b
pure  ∷ a →   f a
pure  ∷ a → (C e) a
(<*>) ∷   f (a → b) →   f a →   f b
(<*>) ∷ (C e) (a → b) → (C e) a → (C e) b

C e ≡ (Constant e)

\begin{code}

newtype Constant a b =
  Constant { getConstant ∷ a }
  deriving (Eq, Ord, Show)

\end{code}

Once more, functor has type signature:
fmap  ∷ (a → b) → (C e) a → (C e) b

Type of (C e b), is whith type mark of phantom 'b'.
And type of 'b' depends on type of function (a -> b), which is never applied,
but its type influence the result type.

That is why:
  fmap _ ce = ce
would not typecheck,

compiler needs an ability to reasemble structure under new type.
That is why:
\begin{code}
instance Functor (Constant e) where
  fmap _ (Constant e) = Constant e

\end{code}
\begin{code}

\end{code}

pure  ∷ a → (C e) a
Where 'a' influences result (C e a) only as a phantom type in type signature.
The most standard, primitive implementation of pure  ∷ a → (C e) a is
to always supply 'mempty'.
In book it is peeked that:
pure 1 :: Constant String Int ≡ Constant {getConstant = ""}

Indeed, (mempty ∷ String) ≡ ""

(<*>) ∷ (C e) (a → b) → (C e) a → (C e) b
In it inputs are two instances of values (C e), and one (C e) as result.
We can discard one value, or more info preserving - to combine them.

In book it is peeked that:
(<*>) (Constant (Sum 1)) (Constant (Sum 2)) ≡ Constant {getConstant = Sum {getSum = 3}}

So that is why:
\begin{code}
instance Monoid a ⇒ Applicative (Constant a) where
  pure _ = Constant { getConstant = mempty }
  (<*>) (Constant e1) (Constant e2) = Constant { getConstant = e1 <> e2 }

\end{code}

ATM we do not learned about Applicative laws, so we assume that it is true Applicative.
\begin{code}

main ∷ IO ()
main =
  do
    print (pure 1 :: Constant String Int)
    print $ (<*>) (Constant (Sum 1)) (Constant (Sum 2))
\end{code}
