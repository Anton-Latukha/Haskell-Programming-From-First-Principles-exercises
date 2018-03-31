-- The trick is by requirement we need not match by substring or chars, but presence of chars in the list in the order, 'h' before 'b','l','a' would not match.

import Data.List

isSubseqOf :: (Eq a) => [a] -> [a] -> Bool
isSubseqOf input@(i:is) set
  | is == [] && elem i set = True
  | set == [] = False
  | elem i set = isSubseqOf is (tail (dropWhile (/=i) set))
  | True = False
