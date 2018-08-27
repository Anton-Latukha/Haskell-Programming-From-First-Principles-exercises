mySqr = [x^2 | x <- [1..10]]

[x | x <- mySqr, rem x 2 == 0]

[(x, y) | x <- mySqr, x < 50,
          y <- mySqr, y > 50]

take 5 [(x, y) | x <- mySqr, x < 50,
                 y <- mySqr, y > 50]
