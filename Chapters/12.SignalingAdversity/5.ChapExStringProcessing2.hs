-- >>> countTheBeforeVowel "the cow"
-- 0
-- >>> countTheBeforeVowel "the evil cow"
-- 1

import Data.Char (toLower)
import Data.Maybe (fromMaybe)

countTheBeforeVowel :: String -> Integer
countTheBeforeVowel str = go [] str
  where
    go :: Int -> String -> Integer
    go result_list str = foldr (\ s r -> zip (checkThe s r) (tail (checkVowel s r))) result_list (words str)

    checkVowel :: String -> [Bool] -> [Bool]
    checkVowel str result_list = if elem (head (tolower str)) [a,e,i,o,u]
      then True : result_list
      else False : result_list

    checkThe :: String -> [Bool] -> [Bool]
    checkThe str result_list = if fmap (toLower) str == "the"
      then True : result_list
      else False : result_list
