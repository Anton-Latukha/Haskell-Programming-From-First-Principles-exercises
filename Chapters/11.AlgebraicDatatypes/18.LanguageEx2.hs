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

