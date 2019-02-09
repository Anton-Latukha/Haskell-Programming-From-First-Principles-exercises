\begin{code}
{-# LANGUAGE UnicodeSyntax #-}
\end{code}

Here we enable a new GHC feature (not in Haskell 98), which automatically derives
basic cases of instances (Eq, Show, Arbitrary).
\begin{code}
{-# LANGUAGE GeneralizedNewtypeDeriving #-}

module Main where

import Prelude.Unicode

import Test.QuickCheck
import Test.QuickCheck.Function

\end{code}

Right here to not to bother we use GeneralizedNewtypeDeriving pragma to derive instances.
\begin{code}
newtype Identity a = Identity a
  deriving (Arbitrary, Eq, Show)

instance Functor Identity where
  fmap f (Identity a) = Identity (f a)

\end{code}

Here you can see the written by hand properties that test Functor laws.
\begin{code}

prop_functorId' ∷ (Functor f, Eq (f a)) ⇒ f a → Bool
prop_functorId' a = fmap id (a) ≡ a

prop_functorCompose' ∷ (Eq (f c), Functor f) ⇒ f a → Fun a b → Fun b c → Bool
prop_functorCompose' x (Fun _ f) (Fun _ g) = (fmap (g . f) x) ≡ (fmap g . fmap f $ x)

\end{code}

QuickCheck should test for Functor properties what? - The Identity wrapper (yeah, I mean, constructor).
So `f a = Identity a`

Here you can also observe that generation of functions of `Integer → String` `String → Integer`
\begin{code}

main = do
  quickCheck (prop_functorId' ∷ Identity String → Bool)
  quickCheck (prop_functorId' ∷ Identity Integer → Bool)
  quickCheck (prop_functorCompose' ∷ Identity String → Fun String String → Fun String String → Bool)
  quickCheck (prop_functorCompose' ∷ Identity String → Fun String Integer → Fun Integer String → Bool)
  quickCheck (prop_functorCompose' ∷ Identity Integer → Fun Integer Integer → Fun Integer Integer → Bool)
  quickCheck (prop_functorCompose' ∷ Identity Integer → Fun Integer String → Fun String Integer → Bool)
\end{code}
