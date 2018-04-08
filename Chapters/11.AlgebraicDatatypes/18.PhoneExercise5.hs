-- ---------------------------
-- | 1      | 2 ABC | 3 DEF  |
-- ___________________________
-- | 4 GHI  | 5 JKL | 6 MNO  |
-- ---------------------------
-- | 7 PQRS | 8 TUV | 9 WXYZ |
-- ---------------------------
-- | * ^    | 0 + _ | # .,   |
-- ---------------------------

-- We pretend we don't know additional Haskell things (Data.Text with must be imported qualified and other points that explained in later chapters)

import Data.List (sort, elemIndex)
import Data.Maybe (fromMaybe)
import Data.Char (toLower)


type Button = Char
type Buttons = [Button]
type Symbol = Char
type Symbols = [Symbol]

messages :: [String]
messages =
  ["Wanna play 20 questions",
   "Ya",
   "U 1st haha",
   "Lol ok. Have u ever tasted alcohol",
   "Lol ya",
   "Wow ur cool haha. Ur turn",
   "Ok. Do u think I am pretty Lol",
   "Lol ya",
   "Just making sure rofl ur turn"]


-- Allowed buttons
phoneButtons :: Buttons
phoneButtons = "*#0123456789"

-- Index+1 == number of button presses
phoneCommands :: [Symbols]
phoneCommands = ["^*", ".,#", " +_0", "1", "abc2", "def3", "ghi4", "jkl5", "mno6", "pqrs7", "tuv8", "wxyz9"]


------ Conversion from text (commands) to Button presses


-- Create a reverse (symbol -> button code) dictionary
--- Find the position of symbol in the string, and that position is the number of code repeats
codesArr :: [[Buttons]]
codesArr = fmap (\ value -> fmap (\ c -> replicate ((fromMaybe 5 (elemIndex c value)) + 1) (phoneButtons !! fromMaybe 5 (elemIndex value phoneCommands))) value) phoneCommands


-- phoneCommands is [Symbols], codesArr is [[Buttons]]
dictionarySymbolToCodes :: [(Symbol, Buttons)]
dictionarySymbolToCodes = zip (concat phoneCommands) (concat codesArr)


convTextToCodes :: [(Symbol, Buttons)] -> String -> Buttons
convTextToCodes dictionary text = concatMap (go dictionary) text
  where
    go dictionary char
      | elem char (fmap fst dictionary) = fromMaybe "" (lookup char dictionary)
      | elem char ['A'..'Z'] = "*" ++ (fromMaybe "" (lookup (toLower char) dictionary))
      | True = ""

codeLength :: [(Symbol, Buttons)] -> String -> Int
codeLength dictionary text = length (convTextToCodes dictionary text)




-- Takes list of elements and returnes lists of clusters
clusterization :: (Ord a) => [a] -> [[a]]
clusterization [] = [[]]
clusterization list@(l:_) = cluster : reminder
  where
    cluster = takeWhile (== l) list
    reminder = clusterization (drop (length cluster) list)

strToLower :: String -> String
strToLower text = fmap toLower text

mostUsed :: Ord a => [a] -> a
mostUsed list = snd (maximum records)
  where
    records = fmap frequencyOfCluster clusters
    frequencyOfCluster cluster = (length cluster, head cluster)
    clusters = (clusterization (sort list))

mostUsedSymbol :: Symbols -> Symbol
mostUsedSymbol str = mostUsed (strToLower str)

mostUsedWord :: String -> String
mostUsedWord str = mostUsed cleanWords
  where
    cleanWords = words (
      -- Pass only letters and spaces (leave out other symbols)
      filter (flip elem (['a'..'z']++" "))
             (strToLower str))

messagesToStr :: [String] -> String
messagesToStr messages = concatMap (++ " ") messages

main :: IO()
main = do
  putStrLn ""

  putStrLn "Messages:"
  mapM_ putStrLn messages
  putStrLn ""

  putStrLn "Coded messages:"
  mapM_ putStrLn (fmap (convTextToCodes dictionarySymbolToCodes) messages)
  putStrLn ""

  putStrLn "Number of codes for a message:"
  mapM_ print (fmap (codeLength dictionarySymbolToCodes) messages)
  putStrLn ""

  putStrLn "Most used symbol for a message:"
  mapM_ print (fmap mostUsedSymbol messages)
  putStrLn ""

  putStrLn "The most frequent symbol overall:"
  print (mostUsedSymbol (concat messages))
  putStrLn ""

  putStrLn "The most frequent word overall:"
  print (mostUsedWord (messagesToStr messages))
