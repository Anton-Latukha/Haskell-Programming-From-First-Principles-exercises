\begin{code}
{-# LANGUAGE UnicodeSyntax #-}

module Main where

import Prelude.Unicode

\end{code}
Validation datatype constructor accepts two types.
  If first type (a) recieved - it constructs Failure a.
  If second type (b) recieved - it constructs Success b.
\begin{code}
data Validation a b
  = Failure a
  | Success b
  deriving (Eq, Show)

\end{code}
Here just filling the gap with the asked behaviour.
\begin{code}
instance Semigroup a ⇒
  Semigroup (Validation a b) where
    (<>) (Success a) (Failure b) = Success a
    (<>) (Failure a) (Failure b) = Failure (a <> b)
    (<>) (Success a) (Success b) = Success a
    (<>) (Failure a) (Success b) = Success b

main = do
\end{code}
Binding parametricly polimorphic Validation to types,
  meaning that for `failure` and `success`
  polymorphic variables (a, b) in Validation
  get binded particular types (a is String),
  (b is Int).

So `failure` accepts String,
  `success` accepts Int.
\begin{code}
  let failure ∷ String → Validation String Int
      failure = Failure
      success ∷ Int → Validation String Int
      success = Success

  print $ success 1 <> failure "blah"
  print $ failure "woot" <> failure "blah"
  print $ success  1 <> success 2
  print $ failure "woot" <> success 2
\end{code}
