-- example GHCi session
-- above the functions

-- >>> notThe "the"
-- Nothing
-- >>> notThe "blahtheblah"
-- Just "blahtheblah"
-- >>> notThe "woot"
-- Just "woot"

import Data.Char (toLower)
import Data.Maybe (fromMaybe)


notThe :: String -> Maybe String
notThe str = if fmap toLower str /= "the"
  then Just str
  else Nothing

-- >>> replaceThe "the cow loves us"
-- "a cow lowes us"
replaceThe :: String -> String
replaceThe str = unwords (fmap func (words str))
  where
    func :: String -> String
    func word = fromMaybe "a" (notThe word)

text :: String
text = "the cow loves us"

main :: IO()
main = do
  putStrLn (text ++ " -> " ++ (replaceThe "the cow loves us"))
