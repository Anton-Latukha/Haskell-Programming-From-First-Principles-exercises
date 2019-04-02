\begin{code}
{-# LANGUAGE UnicodeSyntax #-}

module Main where

import Prelude.Unicode

import Control.Applicative ((*>))

sequencing :: IO ()
sequencing = do
  putStrLn "blah"
  putStrLn "another thing"

sequencing' :: IO ()
sequencing' =
  putStrLn "blah" >>
  putStrLn "another thing"

sequencing'' :: IO ()
sequencing'' =
  putStrLn "blah" *>
  putStrLn "another thing"

binding :: IO ()
binding = do
  name <- getLine
  putStrLn name

binding' :: IO ()
binding' =
  getLine >>= putStrLn -- it essentially does `putStrLn (getLine)`, which very roughly like POSIX Shell piping, with types.


main ∷ IO ()
main = do

  putStrLn "\nNow sequencing:\n"
  putStrLn "\nfunc sequencing:"
  sequencing
  putStrLn "\nfunc sequencing':"
  sequencing
  putStrLn "\nfunc sequencing'':"
  sequencing

  putStr "\nNow binding:\n\nfunc binding:\nEnter value: "
  binding
  putStr "\nfunc binding':\nEnter value: "
  binding'

\end{code}
