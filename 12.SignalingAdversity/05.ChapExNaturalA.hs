data Natural =
    Zero
  | Succ Natural
  deriving (Eq, Show)

constructNatural :: Integer -> Maybe Natural
constructNatural integer
  | integer >= 0 = Just (go integer)
    where
      go integer
        | integer > 0 = Succ (go (integer-1))
        | otherwise = Zero
constructNatural otherwise = Nothing

constructInteger :: Natural -> Integer
constructInteger natural = go natural 0
  where
    go (Succ natural) integer = go natural (integer+1)
    go Zero integer = integer

readInt :: IO Integer
readInt = readLn

main :: IO()
main = do
  putStrLn "Please enter the Natural number:"
  num <- readInt
  print (constructNatural num)
