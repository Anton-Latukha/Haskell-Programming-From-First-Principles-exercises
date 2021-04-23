\begin{code}
{-# LANGUAGE UnicodeSyntax #-}

module Main where

import Prelude.Unicode

import Control.Monad (join)

\end{code}
b = f b

join $ fmap :: Monad f => (a -> f b) -> f a -> f b
       =<<  :: Monad f => (a -> f b) -> f a -> f b
flip   >>=  :: Monad f => (a -> f b) -> f a -> f b
\begin{code}

bind ∷ Monad m ⇒ (a → m b) → m a → m b
bind f a = join (fmap f a)


andOne x = [x, 1]

main ∷ IO ()
main = do
  print $ bind  andOne [4, 5, 6]
  print $ (=<<) andOne [4, 5, 6]

\end{code}
