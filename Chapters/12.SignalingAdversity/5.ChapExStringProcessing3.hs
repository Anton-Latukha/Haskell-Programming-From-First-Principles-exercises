-- >>> countTheBeforeVowel "the cow"
-- 0
-- >>> countTheBeforeVowel "the evil cow"
-- 1

import Data.Char (toLower)

countTheBeforeVowel :: String -> Integer
countTheBeforeVowel str = foldr countByRequirements 0 (checkVowels str)
  where

    countByRequirements :: Bool -> Integer -> Integer
    countByRequirements True result = result+1
    countByRequirements _ result = result

    checkVowels :: String -> [Bool]
    checkVowels = fmap (\ c -> toLower c `elem` ['a','e','i','o','u','y'])

string :: String
string = "The evil cow sniffs the aged crow"

main :: IO()
main = do
  putStrLn string
  print (countTheBeforeVowel string)
