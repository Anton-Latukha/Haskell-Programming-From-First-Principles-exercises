Turn readerUnwrap from the previous example back into embedded
through the use of the data constructors for each transformer.

\begin{code}
{-# LANGUAGE UnicodeSyntax #-}

module OuterInner where

import Prelude.Unicode
import Control.Monad.Trans.Except
import Control.Monad.Trans.Maybe
import Control.Monad.Trans.Reader

-- We only need to use return once
-- because it's one big Monad
embedded :: MaybeT (ExceptT String (ReaderT () IO)) Int
embedded = return 1

maybeUnwrap :: ExceptT String (ReaderT () IO) (Maybe Int)
maybeUnwrap = runMaybeT embedded

-- Next
eitherUnwrap :: ReaderT () IO (Either String (Maybe Int))
eitherUnwrap = runExceptT maybeUnwrap

-- Lastly
readerUnwrap :: () -> IO (Either String (Maybe Int))
readerUnwrap = runReaderT eitherUnwrap

-- Modify it to make it work.
embeddedUnwrapped :: MaybeT
           (ExceptT String
             (ReaderT () IO))
           Int
embeddedUnwrapped = MaybeT . ExceptT . ReaderT $ \ r -> do
                                       pure . Right . Just $ 1

\end{code}
\begin{code}
main ∷ IO ()
main = print "a"
\end{code}
