\begin{code}
{-# LANGUAGE UnicodeSyntax #-}
module Main where

import Data.Monoid

type Verb = String
type Adjective = String
type Adverb = String
type Noun = String
type Exclamation = String
madlibbin'
  ∷ Exclamation
  → Adverb
  → Noun
  → Adjective
  → String
madlibbin' e adv noun adj =
  e <> "! he said " <>
  adv <> " as he jumped into his car " <>
  noun <> " and drove off with his " <>
  adj <> " wife."

\end{code}

Now you’re going to refactor this code a bit! Rewrite it using
mconcat.

\begin{code}
madlibbinBetter'
  ∷ Exclamation
  → Adverb
  → Noun
  → Adjective
  → String
madlibbinBetter' e adv noun adj
  = mconcat [ e, "! he said "
            , adv, " as he jumped into his car "
            , noun, " and drove off with his "
            , adj, " wife."
            ]
\end{code}

\begin{code}
main = print "Hello from the main function!"
\end{code}
