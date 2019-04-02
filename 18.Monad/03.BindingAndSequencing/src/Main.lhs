\begin{code}
{-# LANGUAGE UnicodeSyntax #-}

module Main where

import Prelude.Unicode

bindingAndSequencing :: IO ()
bindingAndSequencing = do
  putStrLn "name pls:"
  name <- getLine
  putStrLn ("y helo thar: " ++ name)

bindingAndSequencing' :: IO ()
bindingAndSequencing' =
  putStrLn "name pls:" >>
  getLine >>=
  \name ->
    putStrLn ("y helo thar: " ++ name)

twoBinds :: IO ()
twoBinds = do
  putStrLn "name pls:"
  name <- getLine
  putStrLn "age pls:"
  age <- getLine
  putStrLn ("y helo thar: "
          ++ name ++ " who is: "
          ++ age ++ " years old.")

twoBinds' :: IO ()
twoBinds' =
  putStrLn "name pls:" >>
  getLine >>=
  \name ->
    putStrLn "age pls:" >>
  getLine >>=
  \age ->
    putStrLn ("y helo thar: "
              ++ name ++ " who is: "
              ++ age ++ " years old.")


\end{code}
With (>>) and (>>=) and function application and recursion - it is possible create endless streams of complex IO().
\begin{code}

main ∷ IO ()
main = do
  putStrLn "\nRunning bindingAndSequencing: "
  bindingAndSequencing
  putStrLn "\nRunning bindingAndSequencing': "
  bindingAndSequencing'
  putStrLn "\nRunning twoBinds: "
  twoBinds
  putStrLn "\nRunning twoBinds': "
  twoBinds'
\end{code}
