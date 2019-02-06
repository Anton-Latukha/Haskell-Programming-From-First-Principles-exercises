\begin{code}
{-# LANGUAGE UnicodeSyntax #-}

module Main where

import Prelude.Unicode

newtype Mem s a =
  Mem {
    runMem ∷ s → (a,s)
  }

\end{code}
Since this is record syntax the type is `Mem :: (s -> (a, s)) -> Mem s a`
Since the `a` is monoid - the default value for it is identity element.
\begin{code}

instance Monoid a ⇒ Monoid (Mem s a) where
  mempty = Mem (\s → (mempty, s))

\end{code}
First element of the result is monoidal, so elements from two function compose togather.
Second element of the result of the fist funstion gets passed and applied to the second funtion.
\begin{code}

instance Semigroup a ⇒ Semigroup (Mem s a) where
  (<>) (Mem f) (Mem g) = Mem (\s → (fst (f s) <> fst (g s), snd.g.snd.f $ s))

f' = Mem $ \s → ("hi", s + 1)

main = do
  let rmzero = runMem mempty 0
      rmleft = runMem (f' <> mempty) 0
      rmright = runMem (mempty <> f') 0
  print $ rmleft
  print $ rmright
  print $ (rmzero ∷ (String, Int))
  print $ rmleft ≡ runMem f' 0
  print $ rmright ≡ runMem f' 0

\end{code}
