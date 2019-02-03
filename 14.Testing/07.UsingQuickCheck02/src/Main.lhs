\begin{code}
{-# LANGUAGE UnicodeSyntax #-}

module Main where

import Prelude.Unicode

import Test.QuickCheck
import Data.List (sort)


\end{code}

The task is "for any list you apply sort to"
Provided sample code uses Maybe inside go pattern.
And by `go` returning accumulative tuple and taking `snd` from it -
we recieve the bool state does list is sorted.

@ allows to supply real value, while patternmatch with bottom,
in a simple pritty form.
\begin{code}

listOrdered ∷ Ord a ⇒ [a] → Bool
listOrdered xs =
  snd $ foldr go (Nothing, True) xs
  where go _ status@(_, False) = status
        go y (Nothing, bool)   = (Just y, bool)
        go y (Just x, bool)    = (Just y, x≥y)

prop_listOrdered ∷ Ord a ⇒ [a] → Bool
prop_listOrdered list = listOrdered (sort list)

main ∷ IO ()
main = do
  quickCheck (prop_listOrdered ∷ [Bool] → Bool)
  quickCheck (prop_listOrdered ∷ [Integer] → Bool)
  quickCheck (prop_listOrdered ∷ String → Bool)
\end{code}
