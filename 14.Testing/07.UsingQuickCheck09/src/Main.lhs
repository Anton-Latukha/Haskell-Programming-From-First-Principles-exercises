\begin{code}
{-# LANGUAGE UnicodeSyntax #-}

module Main where

import Prelude.Unicode

import Test.QuickCheck

green = "\x1b[32m"
clean = "\x1b[0m"

\end{code}
Cons (:) is the base operation.

:i (:)
data [] a = ... | a : [a] 	-- Defined in ‘GHC.Types’
infixr 5 :

:t (:)
(:) :: a -> [a] -> [a]

Concatenation (++) is an abstraction over cons.

:i (++)
(++) :: [a] -> [a] -> [a] 	-- Defined in ‘GHC.Base’
infixr 5 ++



They essentially are the same operation, but as you see cons requires a single type unit as first argument.
'1':"23"

While through abstraction over cons - (++) automates consing list to list:
"12"++"34"

Don't forget that is the abstraction over (++) allowing concatenate the lists of lists, `concat` that is:

:i concat
concat :: Foldable t => t [a] -> [a] 	-- Defined in ‘Data.Foldable’

So fold with cons is essentially a (++):
foldr :: Foldable t => (a -> b -> b) -> b -> t a -> b
foldr (:) ∷ [a] -> t a → [a]

Fold over (++) is a `concat`:
foldr :: Foldable t => (a -> b -> b) -> b -> t a -> b
foldr (++) [] ∷ t [a] → [a]

\begin{code}

prop_ConsFold ∷ Eq a ⇒ [a] → [a] → Bool
prop_ConsFold list1 list2 = foldr (:) list2 list1 ≡ list1 ++ list2

prop_ConcatFold ∷ Eq a ⇒ [[a]] → Bool
prop_ConcatFold listOfLists = foldr (++) [] listOfLists ≡ concat listOfLists


main = do
  putStrLn ("\n\n" ++ green ++
            "Testing that\nfoldr (:) ≡ (++)" ++ clean
           )
  quickCheck (prop_ConsFold ∷ [Integer] → [Integer] → Bool)
  quickCheck (prop_ConsFold ∷ [String] → [String] → Bool)
  putStrLn ("\n\n" ++ green ++
            "Testing that\nfoldr (++) [] ≡ concat" ++ clean
           )
  quickCheck (prop_ConcatFold ∷ [[Integer]] → Bool)
  quickCheck (prop_ConcatFold ∷ [[String]] → Bool)
  putStrLn "\n\n"
\end{code}
