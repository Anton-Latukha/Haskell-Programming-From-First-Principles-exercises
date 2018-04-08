-- ---------------------------
-- | 1      | 2 ABC | 3 DEF  |
-- ___________________________
-- | 4 GHI  | 5 JKL | 6 MNO  |
-- ---------------------------
-- | 7 PQRS | 8 TUV | 9 WXYZ |
-- ---------------------------
-- | * ^    | 0 + _ | # .,   |
-- ---------------------------

-- We pretend we don't know about additionals (Data.Text with must be imported qualified and other points that explained in later chapters)

import Data.List
import Data.Maybe
import Data.Char


type Button = Char
type Buttons = [Button]
type Symbol = Char
type Symbols = [Symbol]


-- Allowed buttons
phoneButtons :: Buttons
phoneButtons = "*#0123456789"

-- Index+1 == number of button presses
phoneCommands :: [Symbols]
phoneCommands = ["^*", ".,#", " +_0", "1", "abc2", "def3", "ghi4", "jkl5", "mno6", "pqrs7", "tuv8", "wxyz9"]


------ Conversion from text (commands) to Button presses


-- Create a reverse (symbol -> button code) dictionary
codesArr :: [[Buttons]]
codesArr = fmap (\ value -> fmap (\ c -> replicate ((fromMaybe 5 (elemIndex c value)) + 1) (phoneButtons !! fromMaybe 5 (elemIndex value phoneCommands))) value) phoneCommands


-- phoneCommands is [Symbols], codesArr is [[Buttons]]
dictionarySymbolToButtons :: [(Symbol, Buttons)]
dictionarySymbolToButtons = zip (concat phoneCommands) (concat codesArr)


convTextToCodes :: [(Symbol, Buttons)] -> String -> Buttons
convTextToCodes dictionary text = concatMap (go dictionary) text
  where
    go dictionary char
      | elem char (fmap fst dictionary) = fromMaybe "" (lookup char dictionary)
      | elem char ['A'..'Z'] = "*" ++ (fromMaybe "" (lookup (toLower char) dictionary))
      | True = ""


convo :: [String]
convo =
  ["Wanna play 20 questions",
   "Ya",
   "U 1st haha",
   "Lol ok. Have u ever tasted alcohol",
   "Lol ya",
   "Wow ur cool haha. Ur turn",
   "Ok. Do u think I am pretty Lol",
   "Lol ya",
   "Just making sure rofl ur turn"]


fingerTaps :: [(Symbol, Buttons)] -> String -> Int
fingerTaps dictionary text = length (convTextToCodes dictionary text)


-- Takes list of elements and returnes lists of clusters
clusterization :: (Ord a) => [a] -> [[a]]
clusterization [] = [[]]
clusterization list = cluster : reminder
  where
    cluster = takeWhile (== head list) list
    reminder = clusterization (drop (length cluster) list)

strToLower :: String -> String
strToLower text = fmap toLower text

mostUsed :: Ord a => [a] -> a
mostUsed list = snd (maximum records)
  where
    -- records :: [(Int, Symbol)]
    records = fmap (\ cluster -> (length cluster, head cluster)) (clusterization (sort list))

mostUsedSymbol :: Symbols -> Symbol
mostUsedSymbol str = mostUsed (strToLower str)

-- mostUsedWord :: String -> String
mostUsedWord str = mostUsed (words (filter (flip elem (['a'..'z']++" ")) (strToLower str)))

listOfStrToStr :: [String] -> String
listOfStrToStr messages = concat (fmap (++ " ") messages)

main :: IO()
main = do
  mapM_ putStrLn convo
  mapM_ putStrLn (fmap (convTextToCodes dictionarySymbolToButtons) convo)
  mapM_ print (fmap (fingerTaps dictionarySymbolToButtons) convo)
  mapM_ print (fmap mostUsedSymbol convo)
  print (mostUsedSymbol (concat convo))
  print (mostUsedWord (listOfStrToStr convo))
