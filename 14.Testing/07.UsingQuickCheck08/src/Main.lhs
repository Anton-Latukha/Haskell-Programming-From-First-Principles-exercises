\begin{code}
{-# LANGUAGE UnicodeSyntax #-}

module Main where

import Prelude.Unicode

import Test.QuickCheck

\end{code}
Just testing asked properties of '$'.
\begin{code}

prop_DollarSign ∷ Eq a ⇒ a → Bool
prop_DollarSign a = id $ a ≡ id a

prop_DollarSignCompose ∷ Eq a ⇒ a → Bool
prop_DollarSignCompose a = id . id $ a ≡ id (id a)

green = "\x1b[32m"
clean = "\x1b[0m"

functionName = "dollar sign association"

main = do
  putStrLn ("\n\n" ++ green ++
            "Basic property of " ++ functionName ++ " passed as an aggument:" ++ clean
           )
  quickCheck (prop_DollarSign ∷ Integer → Bool)
  quickCheck (prop_DollarSign ∷ String → Bool)
  putStrLn ("\n\n" ++ green ++
            "Usage of a " ++ functionName ++ "coupled with function composition:" ++ clean
           )
  quickCheck (prop_DollarSignCompose ∷ Integer → Bool)
  quickCheck (prop_DollarSignCompose ∷ String → Bool)
  putStrLn "\n\n"
\end{code}
