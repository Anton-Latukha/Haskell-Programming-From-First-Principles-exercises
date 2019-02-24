\begin{code}
liftedInc :: (Functor f, Num b) => f b -> f b
liftedInc = fmap (+1)
liftedShow :: (Functor f, Show a) => f a -> f String
liftedShow = fmap show
\end{code}
