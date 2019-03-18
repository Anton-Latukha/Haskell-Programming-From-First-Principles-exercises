Assignment in form understandable for humans:

Using `liftA3` from Control.Applicative, write a function that takes inputs from
`stops` and `vowels` and makes 3-tuples of all possible stop-vowel-stop
combinations.
\begin{code}
{-# LANGUAGE UnicodeSyntax #-}

module Main where

import Prelude.Unicode

import Control.Applicative (liftA3)
-- liftA3 ∷ Applicative f ⇒ (a → b → c → d) → f a → f b → f c → f d
stops :: String
stops = "pbtdkg"

vowels :: String
vowels = "aeiou"

\end{code}

Cartesian produt can be achieved directly by liftA functions.

liftA functions operate like:
f <$> a <*> b    -- liftA2

liftA3 is:
f <$> a <*> b <*> c    -- which is exactly what is needed
\begin{code}
combos :: [a] → [b] → [c] → [(a, b, c)]
combos = liftA3 (,,)


main ∷ IO ()
main = print $ combos stops vowels stops
\end{code}
