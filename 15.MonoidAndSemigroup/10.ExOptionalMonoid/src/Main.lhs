From now on I would use literate programming.

Lets also translate Haskell syntax to math Unicode syntax by using pragma.

\begin{code}
{-# LANGUAGE UnicodeSyntax #-}

module OptionalMonoid where
\end{code}

From GHC > 4.11, as in math, - Semigroup is a superclass of Monoid, inside language. As such Semigroup module needs to be imported, and `(<>)` needs to be declared in Semigroup.

\begin{code}
import Data.Semigroup
\end{code}

Import a class for monoids (types with an associative binary operation that has an identity) with various general-purpose instances.

\begin{code}
import Data.Monoid
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
