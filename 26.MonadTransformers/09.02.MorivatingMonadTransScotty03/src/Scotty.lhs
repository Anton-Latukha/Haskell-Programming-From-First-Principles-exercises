\begin{code}
{-# LANGUAGE UnicodeSyntax #-}
{-# LANGUAGE OverloadedStrings #-}

module Scotty where

import Prelude.Unicode
import Web.Scotty
import Web.Scotty.Internal.Types (ActionT(..))
import Control.Monad (liftM)
import Control.Monad.Trans.Class
import Control.Monad.Trans.Except

\end{code}
\begin{code}
main ∷ IO ()
main = scotty 3000 $ do
  get "/:word" $ do
    beam <- param "word"
    (ActionT
     . (ExceptT . liftM Right)
     . lift
     . lift)
      $ putStrLn "hello"
    html $
      mconcat ["<h1>Scotty, ",
               beam,
               " me up!</h1>"]

\end{code}
