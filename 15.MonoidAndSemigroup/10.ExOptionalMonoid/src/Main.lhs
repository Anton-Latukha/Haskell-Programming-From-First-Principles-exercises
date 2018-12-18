From now on I would use literate programming.

Lets also translate Haskell syntax to math Unicode syntax by using pragma.

\begin{code}
{-# LANGUAGE UnicodeSyntax #-}

module Main where
\end{code}

From GHC > 4.11, as in math, - Semigroup is a superclass of Monoid, inside language. As such Semigroup module needs to be imported, and `(<>)` needs to be declared in Semigroup.

\begin{code}
import Data.Semigroup
\end{code}

Import a class for monoids (types with an associative binary operation that has an identity) with various general-purpose instances.

\begin{code}
import Data.Monoid
\end{code}

For check of specs.

\begin{code}
import Test.Hspec
\end{code}

Asked datatype.
\begin{code}
data Optional a
  = Nada
  | Only a
  deriving (Eq, Show)
\end{code}

$\forall a in Monoid : Semigroup of 'Optional a' is$

\begin{code}
instance Monoid a ⇒ Semigroup (Optional a) where
  (<>) (Only a) (Only b) = Only ((<>) a b)
  (<>) (Only a) Nada = Only ((<>) a mempty)
  (<>) Nada (Only b) = Only ((<>) mempty b)
  (<>) Nada Nada = Nada
\end{code}

After declaration of Semigroup for 'Optional a' - the only thing left is to point-out identity value.

\begin{code}
instance Monoid a ⇒ Monoid (Optional a) where
  mempty = Nada
\end{code}


\begin{code}
main :: IO ()
main = hspec $ do
  describe "Check how Optional works:" $ do
    it "Only (Sum 1) `mappend` Only (Sum 1) = Only (Sum {getSum = 2})" $ do
      Only (Sum 1) `mappend` Only (Sum 1) `shouldBe` Only (Sum {getSum = 2})
    it "Only (Product 4) `mappend` Only (Product 2) = Only (Product {getProduct = 8})" $ do
      Only (Product 4) `mappend` Only (Product 2) `shouldBe` Only (Product {getProduct = 8})
    it "Only (Sum 1) `mappend` Nada = Only (Sum {getSum = 1})" $ do
      Only (Sum 1) `mappend` Nada `shouldBe` Only (Sum {getSum = 1})
    it "Only [1] `mappend` Nada = Only [1]" $ do
      Only [1] `mappend` Nada `shouldBe` Only [1]
    it "Nada `mappend` Only (Sum 1) = Only (Sum {getSum = 1})" $ do
      Nada `mappend` Only (Sum 1) `shouldBe` Only (Sum {getSum = 1})
\end{code}
