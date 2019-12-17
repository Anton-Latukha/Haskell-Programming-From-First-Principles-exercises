\begin{code}
{-# LANGUAGE UnicodeSyntax #-}
{-# LANGUAGE OverloadedStrings #-}

module Scotty where

import Prelude.Unicode
import Web.Scotty
import Control.Monad.IO.Class

\end{code}
\begin{code}
main ∷ IO ()
main = scotty 3000 $ do
  get "/:word" $ do
    beam <- param "word"
    liftIO $ putStrLn "hello"
    html $
      mconcat ["<h1>Scotty, ",
               beam,
               " me up!</h1>"]

\end{code}
