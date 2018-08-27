-- 3. Implement a -> b -> b. How many implementations can
-- it have? Does the behavior change when the types of a
-- and b change?
--  
module ABB where

f :: a -> b -> b
f a b = b
