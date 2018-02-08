{-# LANGUAGE NoMonomorphismRestriction #-}


module DetermineTheType where


-- simple example
example = 1

-- 1. All function applications return a value. Determine the
-- value returned by these function applications and the type
-- of that value.

a = (* 9) 6
b = head [(0,"doge"),(1,"kitteh")]
c = head [(0,"doge"),(1 :: Integer,"kitteh")]
d = if False then True else False
e = length [1,2,3,4,5]
f = (length [1,2,3,4]) > (length "TACOCAT")
