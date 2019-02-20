\begin{code}
{-# LANGUAGE UnicodeSyntax #-}

module Main where

import Prelude.Unicode
import Control.Applicative (liftA3)


\end{code}

This exercises are about frequent <$> <*> <*> pattern.
And pure is used to wrap data into container that is needed.
\begin{code}

ex1 = const <$> Just "Hello" <*> pure "World"

ex2 = (,,,) <$> Just 90 <*> Just 10 <*> Just "Tierness" <*> pure [1, 2, 3]
ex2Lift = liftA3 (,,,) (Just 90) (Just 10) (Just "Tierness") <*> pure [1, 2, 3]


main ∷ IO ()
main = do
  print ex1
  print ex2
  putStrLn $ "Is `ex2Lift`≡`ex2`: " ++ show (ex2Lift ≡ ex2)
\end{code}
