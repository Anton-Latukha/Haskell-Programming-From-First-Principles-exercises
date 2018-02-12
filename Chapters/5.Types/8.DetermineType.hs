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


-- 2. Given
w = y * 10 where
    y = x + 5
    x = 5

-- What is the type of w?


-- 3. Given
y = x + 5 where
    x = 5
z y = y * 10
    
    
-- What is the type of z?


-- 4. Given
f4 = 4 / y where
    y = x + 5
    x = 5

-- What is the type of f?


-- 5. Given
f5 = x ++ y ++ z where
    x = "Julie"
    y = " <3 "
    z = "Haskell"

-- What is the type of f?
