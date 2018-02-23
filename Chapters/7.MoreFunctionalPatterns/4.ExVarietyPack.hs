-- 2. Fill in the definition of the following function:

-- Remember: Tuples have the
-- same syntax for their
-- type constructors and
-- their data constuctors.

f :: (a, b, c) -> (d, e, f) -> ((a, d), (c, f))
f (a, b, c) (d, e, f) = ((a, d), (c, f))
