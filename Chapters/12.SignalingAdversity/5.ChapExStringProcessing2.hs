-- >>> countTheBeforeVowel "the cow"
-- 0
-- >>> countTheBeforeVowel "the evil cow"
-- 1

import Data.Char (toLower)
import Data.Maybe (fromMaybe)

countTheBeforeVowel :: String -> Integer
countTheBeforeVowel str = go str
  where
    go :: String -> Integer
    go str = foldr countByRequirements 0 reqTuples

    countByRequirements tuple result = if fst tuple && snd tuple then result+1 else result

    reqTuples = zip listThe (tail listVowel)

    listThe = foldr (\ w l -> (checkThe w) : l) [] wOrds

    listVowel = foldr (\ w l -> (checkVowel w) : l) [] wOrds

    wOrds = words str

    checkVowel :: String -> Bool
    checkVowel str = if elem (head (fmap (toLower) str)) ['a','e','i','o','u']
      then True
      else False

    checkThe :: String -> Bool
    checkThe str = if fmap (toLower) str == "the"
      then True
      else False

string = "The evil cow snuffs the aged crow"

main :: IO()
main = do
  putStrLn string
  print (countTheBeforeVowel string)
