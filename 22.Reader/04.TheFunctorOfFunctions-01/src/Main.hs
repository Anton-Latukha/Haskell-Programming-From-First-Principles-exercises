module Main where

data (->) a b

instance Functor ((->) a)
-- Functor laws:
-- fmap id fa = f (id a) = id $ fa
-- fmap id = id
-- fmap (b . a) = fmap b . fmap a

instance Applicative ((->) a)
-- pure ab <*> fa = fmap ab fa
-- =>
-- pure id <*> x = x
-- pure (.) <*> c <*> b <*> a = c <*> b <*> a
-- pure (f x) = pure f <*> pure x
-- b <*> pure a = pure ($ a) <*> b

instance Monad ((->) a)
-- pure x >>= f = f x
-- f =<< pure x = f x

main ∷ IO ()
main = print "a"
