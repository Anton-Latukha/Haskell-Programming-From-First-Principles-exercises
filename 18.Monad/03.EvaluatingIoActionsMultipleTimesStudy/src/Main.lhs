\begin{code}
{-# LANGUAGE UnicodeSyntax #-}

module Main where

import Prelude.Unicode
import System.Random (randomRIO)
import Control.Monad ((>>), (>>=))
\end{code}

Book already has poors man example (typing evaluations manually).

Let's make things harder.
We would use possibility to practice here a little more,
let's say in Haskell to ask mashine to continuasly and randomly to ask itself to
evaluate first or second.

We would practice:
1. Dragging IO() through the code, observe that it is quite
demanding mentally procedure.
2. Working with real life random generators, and
we, like in reality - would also need to be able to get from it an infinite
stream of random values, and also of (IO a). And drag all this throuh code.
3. Combining 1&2 to do what we need and result in IO().

Study this solution, and try to come up with your version of events.
\begin{code}

print1 = putStr "1"
print2 = putStr "2"

twoActions ∷ (IO (), IO ())
twoActions = (print1, print2)

printOneOf ∷ Bool → IO ()
printOneOf False = fst twoActions
printOneOf  True = snd twoActions

\end{code}

randomRIO ∷ Random a ⇒ (a, a) → IO a
Function uses as source a real system (pseudo)random generator exposed by the OS
And we tell randomRIO to generate random values in range (False, True)

Then we do a Kung-Fu and bind it to return of the function:

randomRIO ∷ Random a ⇒ (a, a) → IO a                            |
               (>>=) ∷ Monad m ⇒ m a → (   a →  m b) →  m b     | Note types
                               quant ∷ (Bool → IO b) → IO b     V

quant (printOneOf) would give us one random value.


Since:
quant = (>>=) (randomRIO (False, True)) ≡ bool ← (randomRIO (False, True))

Then:
quant (printOneOf) ≡ bool ← (randomRIO (False, True))
                     printOneOf bool

And it would print one IO() value.

How now make this into infinite stream of IO()? You already know, but maybe not
thought about it this way.

                  quant ∷ (Bool → IO b)  → IO b ; printOneOf ∷ Bool → IO ()
recursePrintOneOf ∷ Monad m ⇒ ( t        →  m a)                  → t      → m b
\begin{code}
quant ∷ (Bool → IO b) → IO b
quant = (>>=) $ randomRIO (False, True)


\end{code}

Last trick: form (f x) triggers application, so triggers evaluation of f (which
generates random value), and then it gets printed, because of laziness.
If you just y insted of (f x) - this would signal GHC to collapse (f x) into y,
and that is a signal to GHC that it can optimize recursion to use
one value through all recursion, and GHC would go through infinite recursion to
reach to its end to get optimized structure. This is the way I understand it
at the moment of writing.
\begin{code}
recursePrintOneOf ∷ Monad m ⇒ (t → m a) → t → m b
recursePrintOneOf f x = f x >> recursePrintOneOf f x

main ∷ IO ()
main = recursePrintOneOf (quant) printOneOf

\end{code}
