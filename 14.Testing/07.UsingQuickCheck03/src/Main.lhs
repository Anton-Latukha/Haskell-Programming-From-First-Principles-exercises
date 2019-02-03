\begin{code}
{-# LANGUAGE UnicodeSyntax #-}

module Main where

import Prelude.Unicode

import Test.QuickCheck

\end{code}
By parametric abstraction over function that is under test - we make code much more universal.
\begin{code}
prop_Associative ∷ (Eq a) ⇒ (a → a → a) → a → a → a → Bool
prop_Associative f x y z = f x (f y z) ≡ f (f x y) z

prop_Commutative ∷ (Eq a) ⇒ (a → a → a) → a → a → Bool
prop_Commutative f x y = f x y ≡ f y x

green = "\x1b[32m"
clean = "\x1b[0m"

functionName = "addition operation"

main = do
  putStrLn ("\n\n" ++ green ++
            "Is " ++ functionName ++ " associative:" ++ clean
           )
  quickCheck (prop_Associative (+) ∷ Integer → Integer → Integer → Bool)
  quickCheck (prop_Associative (+) ∷ Int → Int → Int → Bool)

  putStrLn ("\n\n" ++ green ++
            "Is " ++ functionName ++ " commutative:" ++ clean
           )
  quickCheck (prop_Commutative (+) ∷ Integer → Integer → Bool)
  quickCheck (prop_Commutative (+) ∷ Int → Int → Bool)
\end{code}
