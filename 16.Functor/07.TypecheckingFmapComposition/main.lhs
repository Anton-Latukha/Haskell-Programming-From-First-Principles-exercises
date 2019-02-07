\begin{code}
(.) ∷ (b → c) → (a → b) → a → c
fmap ∷ Functor f => (m → n) → f m → f n
fmap ∷ Functor g => (x → y) → g x → g y

(.) ∷ (Functor f, Functor g) ⇒ ((g x → g y) → (f.g (x) → f.g (y)))
                             → ((x → y)     → (g x → g y))
                             → (x → y)
                             → (f.g (x) → f.g. (y))
a ≡ (x → y)
b ≡ (g x → g y)
c ≡ (f.g (x) → f.g. (y)

fmap.fmap ∷ (x → y) → f.g (x) → f.g. (y)
\end{code}
