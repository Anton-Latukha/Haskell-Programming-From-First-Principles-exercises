import Data.Char

countVowel :: String -> Int
countVowel string = length (filter (\x -> (toLower x) `elem` "aeiouy") string)

countConsonant :: String -> Int
countConsonant string = length (filter (\x -> (toLower x) `elem` "bcdfghjklmnprstvxz") string)

compareConsVow :: String -> Bool
compareConsVow string = countConsonant string >= countVowel string

main :: IO()
main = do
  putStrLn "Please enter the line to check if that is that looks like speech (if it has more consonants then vowels):"
  string <- getLine
  putStrLn string
  print (compareConsVow string)
