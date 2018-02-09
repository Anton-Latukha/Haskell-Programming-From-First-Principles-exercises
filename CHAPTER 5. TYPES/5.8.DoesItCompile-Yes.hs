{- For each set of expressions, figure out which expression, if any,
causes the compiler to squawk at you (n.b. we do not mean
literal squawking) and why. Fix it if you can. -}

{-# LANGUAGE NoMonomorphismRestriction #-}

-- 1.
bigNum = (^) 5 $ 10
wahoo = bigNum


-- 2.
y = print "woohoo!"
z = "hello world"


-- 3.
a3 = (+)
b3 = 5
c3 = a3 b3 10
d3 = a3 c3 200


-- 4.
a4 = 12 + b4
b4 = 10000 * c4
c4 = 1
