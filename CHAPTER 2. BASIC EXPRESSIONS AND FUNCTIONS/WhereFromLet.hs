module WhereFromLet where

print5 = print x
  where x = 5

pow5 = x*x
  where x = 5

printXY = x*y
  where x = 5
        y = 6

leftY = x + 3
  where x = 3
        y = 1000
