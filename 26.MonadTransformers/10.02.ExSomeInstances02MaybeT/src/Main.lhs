\begin{code}
{-# LANGUAGE UnicodeSyntax #-}
{-# LANGUAGE InstanceSigs #-}
{-# LANGUAGE LambdaCase #-}

import Control.Monad.IO.Class (MonadIO(..))
import Control.Applicative (liftA2)
import Control.Monad.Trans

newtype MaybeT m a = MaybeT { runMaybeT :: m (Maybe a) }
newtype ReaderT r m a = ReaderT { runReaderT :: r -> m a }
\end{code}

\begin{code}
main :: IO ()
main = putStrLn "a"
\end{code}
