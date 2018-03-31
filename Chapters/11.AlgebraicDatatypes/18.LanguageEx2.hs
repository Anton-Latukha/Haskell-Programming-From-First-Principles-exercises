-- The trick is by requirement we need not match by substring or chars, but presence of chars in the list in the order, 'h' before 'b','l','a' would not match.
import Data.Char


capitalizeWord :: String -> String
capitalizeWord [] = []
capitalizeWord (w:rd) = [(toUpper w)]++rd


capitalizeSentences :: String -> String
capitalizeSentences [] = []
capitalizeSentences text@(_:[]) = capitalizeWord text -- if got only 1 char in String
capitalizeSentences ('.':ext) = "." ++ (capitalizeSentences ext) -- Passthrough '.'
capitalizeSentences (' ':ext) = " " ++ (capitalizeSentences ext) -- Passthrough ' '
capitalizeSentences text = (capitalizeWord fSen) ++ (capitalizeSentences (drop (length fSen) text))
  where
      fSen = takeWhile (/='.') text

