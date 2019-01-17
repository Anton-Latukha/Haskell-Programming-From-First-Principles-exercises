\begin{code}
{-# LANGUAGE UnicodeSyntax #-}

module Main where

import Prelude.Unicode

import Test.QuickCheck
\end{code}

(x/2)=x would always be true only if fraction minimal precigion was not touched
\begin{code}

half ∷ Fractional a ⇒ a -> a
half x = x/2

halfIdentity = (*2) . half

prop_divisionIdentity ∷ Fractional t1 ⇒ t1 → Bool
prop_divisionIdentity x = halfIdentity x ≡ x

main ∷ IO ()
main = putStrLn "asdf"
--main = quickCheck (prop_divisionIdentity ∷ Double → Bool)
\end{code}
