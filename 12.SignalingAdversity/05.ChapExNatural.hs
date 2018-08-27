type Natural = Integer

constructNatural :: Integer -> Maybe Natural
constructNatural integer
  | integer >= 0 = Just integer
  | otherwise = Nothing

constructInteger :: Natural -> Integer
constructInteger integer = integer

readInt :: IO Integer
readInt = readLn

main :: IO()
main = do
  putStrLn "Please enter the Natural number:"
  num <- readInt
  print (constructNatural num)
