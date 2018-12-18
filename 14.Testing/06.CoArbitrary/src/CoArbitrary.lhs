\begin{code}
{-# LANGUAGE UnicodeSyntax #-}
\end{code}

Enable to just derive the Generic instances with pragma
\begin{code}
{-# LANGUAGE DeriveGeneric #-}

module CoArbitrary where

import Prelude.Unicode

import GHC.Generics
import Test.QuickCheck

\end{code}
\begin{code}

data Bool'
  = True'
  | False'
  deriving (Generic)

instance CoArbitrary Bool'

bool'Gen ∷ Bool' → Gen Int
bool'Gen bool = coarbitrary bool arbitrary

yellow = "\x1b[33m"
green = "\x1b[32m"
white = "\x1b[0m"

main ∷ IO ()
main = do
  putStrLn $ yellow ++ "\n\nGenerating functions from True':" ++ green
  sample $ bool'Gen True'
  putStrLn $ yellow ++ "\n\nGenerating functions from False'':" ++ green
  sample $ bool'Gen False'
  putStrLn white
\end{code}
