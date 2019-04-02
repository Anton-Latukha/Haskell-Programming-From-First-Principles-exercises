\begin{code}
{-# LANGUAGE UnicodeSyntax #-}

module Main where

import Prelude.Unicode

f :: Functor f => f String -> f (IO ())
f x = putStrLn <$> x

g :: (String -> b) -> IO b
g x = x <$> getLine

h :: IO (IO ())
h = putStrLn <$> getLine

main ∷ IO ()
main = do
  putStr ("\n" ++
         "(was calling `h = putStrLn <$> getLine` for days...)\n" ++
         "…\n" ++
         "(Monad deity):     - You are now inside IO (IO ()). What is it you want to know?\n" ++
         "(I decide to ask): - ")
  putStrLn <$> getLine
  putStrLn ("\n" ++
           "…\n" ++
           "(… and you learned Haskell at that moment. You wake up from the words singing \"Waking up, good morning to you my dear\"\n)" ++
           "(Mortal dev):      - So, tell me, how it was, to learn Haskell, and inside that IO (IO ())? What it said in responce to your question? Or, you know. Better find me and send your responce to: \"piroxiline+ioio\" somewhere in gmail.")
\end{code}
