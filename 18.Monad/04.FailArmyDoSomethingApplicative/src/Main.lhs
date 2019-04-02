\begin{code}
{-# LANGUAGE UnicodeSyntax #-}

module Main where

import Prelude.Unicode
import Control.Monad (join, liftM3)

f ∷ Integer → Maybe Integer
f 0 = Nothing
f n = Just n

g ∷ Integer → Maybe Integer
g i =
  if even i
    then Just (i + 1)
    else Nothing

h ∷ Integer → Maybe String
h i = Just ("10191" ++ show i)

doSomethingS :: Integer → Integer → Integer → Maybe (Integer, Integer, String)
doSomethingS n1 n2 n3 = do
  a ← f n1
  b ← g n2
  c ← h n3
  pure (a, b, c)


\end{code}

See the sequential nature.
\begin{code}
doSomethingSBind ∷ Integer → Integer → Integer → Maybe (Integer, Integer, String)
doSomethingSBind n1 n2 n3 =
  f n1 >>= \ aL →
  g n2 >>= \ bL →
  h n3 >>= \ cL →
  pure (aL, bL, cL)

\end{code}

Nonsequential
\begin{code}
doSomethingSDissolvedMonad ∷ Integer → Integer → Integer → Maybe (Integer, Integer, String)
doSomethingSDissolvedMonad n1 n2 n3 =
  join (fmap (\ aL →
  join (fmap (\ bL →
  join (fmap (\ cL →
  pure (aL, bL, cL))
  (h n3))) (g n2) )) (f n1))

\end{code}

In doSomethingSBind can be seen that:
(>>=) ∷ Monad m ⇒ m a → (a → m b) → m b

Maybe Integer → (Integer → Maybe (Integer, Integer, String)) → Maybe (Integer, Integer, String)

Functions check and return (Maybe Integer), and then passed into λ functions that return Maybe triple, and then Maybe triple returned.
In a fact we see that initial Maybe needs to be "lifted" up into Maybe triple. There must be a rule how that combination of three Maybe values should combine in one resulting value, and that value lifted over triple. Monad can establish rules of how all three Maybe values would be combined into one, because result of them depend on each other (here sequentially).

Applicative would allow to establish rules how to transform Maybe * → Maybe (*,*,*) - but only for every value independently, we would need to write a intermidiate function with boilerplate code to do: Maybe * → Maybe * → Maybe * → Maybe (*,*,*), essentialy re-implementing the Monad actions.
\begin{code}

doSomethingSApplicativeMonadicBoilerplate ∷ Maybe a → Maybe b → Maybe c → Maybe (a, b ,c)
doSomethingSApplicativeMonadicBoilerplate Nothing _ _ = Nothing
doSomethingSApplicativeMonadicBoilerplate _ Nothing _ = Nothing
doSomethingSApplicativeMonadicBoilerplate _ _ Nothing = Nothing
doSomethingSApplicativeMonadicBoilerplate (Just a) (Just b) (Just c) = Just (a, b, c)

doSomethingSApplicative ∷ Integer → Integer → Integer → Maybe (Integer, Integer, String)
doSomethingSApplicative n1 n2 n3 = doSomethingSApplicativeMonadicBoilerplate (f n1) (g n2) (h n3)

\end{code}

If I not simplified doSomething to doSomethingS - as said in the book - sometimes it would be almost impossible to describe all cases of structure matching, without sequencing of compuation. Especially the more polymorphism we have. We writing boilerplate for particular types, Monad allows polymorphism.

For Maybe Monad it is what we implemented:
instance Monad Maybe where
  return x = Just x
  (Just x) >>= k  = k x
  Nothing >>= _   = Nothing

\begin{code}

doSomethingDo n = do
  a ← f n
  b ← g a
  c ← h b
  pure (a, b, c)

\end{code}

Parsing IO getLine input into proper type:
\begin{code}

main ∷ IO ()
main = do
  putStr "Enter Integer #1: "
  n1 ← getLine
  putStr "Enter Integer #2: "
  n2 ← getLine
  putStr "Enter Integer #3: "
  n3 ← getLine
  putStrLn "\ndoSomethingS returns:"
  print $ doSomethingS (read n1) (read n2) (read n3)
  putStrLn "\ndoSomethingSBind returns:"
  print $ doSomethingSBind (read n1) (read n2) (read n3)
  putStrLn "\ndoSomethingSDissolvedMonad returns:"
  print $ doSomethingSDissolvedMonad (read n1) (read n2) (read n3)
  putStrLn "\ndoSomethingSApplicative returns:"
  print $ doSomethingSApplicative (read n1) (read n2) (read n3)
  putStrLn "\nSeems about right.\n"
\end{code}
