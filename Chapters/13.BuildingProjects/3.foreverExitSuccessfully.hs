import Control.Monad (forever)
import Data.Char (toLower, isLetter)
import System.Exit (exitSuccess)

palindrome :: IO ()
palindrome = forever $ do
  line1 <- getLine
  let lineStripped = fmap (toLower) (filter (isLetter) line1)
  case ( lineStripped == reverse lineStripped ) of
    True -> putStrLn "It's a palindrome!"
    False -> exitSuccess
