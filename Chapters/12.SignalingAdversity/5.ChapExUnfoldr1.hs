
myIterate :: (a -> a) -> a -> [a]
myIterate f a = a:myIterate f (f a)
