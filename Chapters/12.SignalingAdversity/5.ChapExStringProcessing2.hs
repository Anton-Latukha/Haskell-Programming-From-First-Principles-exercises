-- >>> countTheBeforeVowel "the cow"
-- 0
-- >>> countTheBeforeVowel "the evil cow"
-- 1

import Data.Char (toLower)

countTheBeforeVowel :: String -> Integer
countTheBeforeVowel str = go str
  where
    go :: String -> Integer
    go str = foldr countByRequirements 0 reqTuples

    countByRequirements tuple result = if fst tuple && snd tuple then result+1 else result

    reqTuples = zip listThe (tail listVowel)

    listThe = fmap checkThe wOrds

    listVowel = fmap checkVowel wOrds

    wOrds = words str

    checkVowel :: String -> Bool
    checkVowel str = elem (head (fmap toLower str)) ['a','e','i','o','u']

    checkThe :: String -> Bool
    checkThe str = fmap toLower str == "the"

string :: String
string = "The evil cow sniffs the aged crow"

main :: IO()
main = do
  putStrLn string
  print (countTheBeforeVowel string)
