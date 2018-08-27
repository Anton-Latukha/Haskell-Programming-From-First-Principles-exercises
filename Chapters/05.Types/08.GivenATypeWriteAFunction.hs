module GivenATypeWriteAFunction where


{- 1. There is only one function definition that typechecks and
doesn’t go into an infinite loop when you run it. -}
i :: a -> a
i x = x


{- 2. There is only one version that works. -}

c :: a -> b -> a
c x y = x


{- 3. Given alpha equivalence are c'' and c (see above) the same
thing? -}

c'' :: b -> a -> b
-- Yes
c'' x y = c x y


{- 4. Only one version that works. -}
c' :: a -> b -> b
c' x y = y

{- 5. There are multiple possibilities, at least two of which
you’ve seen in previous chapters. -}
r :: [a] -> [a]
r xs = reverse xs


{- 6. Only one version that will typecheck. -}
co :: (b -> c) -> (a -> b) -> a -> c
co bToC aToB a = bToC (aToB a)


{- 7. One version will typecheck. -}
a :: (a -> c) -> a -> a
a aToC a = a


{- 8. One version will typecheck. -}
a' :: (a -> b) -> a -> b
a' aToB a = aToB a
