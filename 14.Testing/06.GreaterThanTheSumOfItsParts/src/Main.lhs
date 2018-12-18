\begin{code}
{-# LANGUAGE UnicodeSyntax #-}

module Main where

import Prelude.Unicode

import Test.QuickCheck
import Test.QuickCheck.Gen (oneof)

data Sum a b
  = First a
  | Second b
  deriving (Eq, Show)

\end{code}
`oneof` is a function that randomly picks one of constructors,
giving every constructor equal probability.
\begin{code}
sumGenEqual ∷ (Arbitrary a, Arbitrary b) ⇒ Gen (Sum a b)
sumGenEqual = do
  a ← arbitrary
  b ← arbitrary
  oneof [return $ First a,
         return $ Second b]

sumGenCharInt ∷ Gen (Sum Char Int)
sumGenCharInt = sumGenEqual

sumGenFirstPls ∷ (Arbitrary a, Arbitrary b) ⇒ Gen (Sum a b)
sumGenFirstPls = do
  a ← arbitrary
  b ← arbitrary
  frequency [(10, return $ First a),
             (1, return $ Second b)]

sumGenCharIntFirst ∷ Gen (Sum Char Int)
sumGenCharIntFirst = sumGenFirstPls

main ∷ IO ()
main = do
  putStrLn ("\n\n"
            ++ "This arbitrary generation produces"
            ++ "mainly values with First constructor:\n"
           )
  sample sumGenCharInt
  putStrLn ("\n\n"
            ++ "This arbitrary produces mainly values with First constructor:"
           )
  sample sumGenCharIntFirst
  putStrLn "\n\n"
\end{code}
