import Data.Char

-- Simple solution

string :: String
string = "The fluffy cow sniffs the playful crow."

vowelStr :: String
vowelStr = filter (\ c -> toLower c `elem` "aeiouy") string

vowNum :: Int
vowNum = length vowelStr

main :: IO ()
main = do
  putStrLn string
  print vowNum
