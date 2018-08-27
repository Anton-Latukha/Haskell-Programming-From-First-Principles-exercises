--  We can get a more comfortable appreciation of para-
-- metricity by looking at a -> a -> a. This hypothetical
-- function a -> a -> a has two–and only two–implementa-
-- tions. Write both possible versions of a -> a -> a. After
-- doing so, try to violate the constraints of parametrically
-- polymorphic values we outlined above.

module AAA where

f1 :: a -> a -> a
f1 a1 a2 = a1


f2 :: a -> a -> a
f2 a1 a2 = a2
