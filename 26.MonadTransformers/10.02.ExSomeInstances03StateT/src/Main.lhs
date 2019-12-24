\begin{code}
{-# LANGUAGE UnicodeSyntax #-}
{-# LANGUAGE InstanceSigs #-}

module Main where

import Control.Monad.IO.Class (MonadIO(..))
import Control.Applicative (liftA2)
import Control.Monad.Trans

newtype StateT s m a = StateT { runStateT :: s -> m (a, s) }


\end{code}
\begin{code}
main ∷ IO ()
main = print "a"
\end{code}
