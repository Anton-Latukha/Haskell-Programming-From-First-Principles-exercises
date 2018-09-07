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
