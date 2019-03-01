\begin{code}
{-# LANGUAGE UnicodeSyntax #-}

module Apl1 where

import Prelude.Unicode
import Control.Applicative
import Data.Monoid
import Test.QuickCheck
import Test.QuickCheck.Checkers
import Test.QuickCheck.Classes


\end{code}

Arbitrary instances already existing in QuickCheck, sos code is not needed.a
\begin{code}

instance Semigroup a ⇒ Semigroup (ZipList a) where
  (<>) = liftA2 (<>)

instance Monoid a ⇒ Monoid (ZipList a) where
  mempty = ZipList []

instance Eq a ⇒ EqProp (ZipList a) where
  (=-=) = eq

main ∷ IO ()
main = quickBatch $ monoid (ZipList [1 ∷ Sum Int])
\end{code}
