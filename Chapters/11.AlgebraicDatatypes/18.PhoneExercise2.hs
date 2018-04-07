-- ---------------------------
-- | 1      | 2 ABC | 3 DEF  |
-- ___________________________
-- | 4 GHI  | 5 JKL | 6 MNO  |
-- ---------------------------
-- | 7 PQRS | 8 TUV | 9 WXYZ |
-- ---------------------------
-- | * ^    | 0 + _ | # .,   |
-- ---------------------------

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


convTextToCodes :: String -> [(Symbol, Buttons)] -> Buttons
convTextToCodes text dictionary = concatMap (go dictionary) text
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


main :: IO()
main = do
  mapM_ putStrLn ((fmap (\ text -> convTextToCodes text dictionarySymbolToButtons) convo))


-----------
---------- This portion left as so for future and not used
-----------


data Phone = Phone [(Button, Symbols)]

-- Validate sequence element as a legitimate button
validButton :: Buttons -> Button -> Bool
validButton phoneButtons button = elem button phoneButtons

-- Create a consistent data model, but only if lists of buttons and commands have same length
phoneDataModel :: Buttons -> [Symbols] -> Phone
phoneDataModel phoneButtons phoneCommands
  | length phoneButtons == length phoneCommands = Phone (zip phoneButtons phoneCommands)
  | True = Phone []



----- Conversion of Buttons to Symbols


-- Takes sequence of Buttons and returnes list of subsequent clusters of the same Button presses
splitToSameTaps :: Buttons -> [Buttons]
splitToSameTaps [] = [[]]
splitToSameTaps str = sameTapsCluster ++ reminder
  where
    sameTaps = takeWhile (== head str) str
    sameTapsCluster = [sameTaps]
    reminder = splitToSameTaps (drop (length sameTaps) str)


-- Translate cluster of the same Button presses into according Symbol
sameTaps :: Buttons -> Buttons -> [Symbols] -> Symbols
sameTaps phoneButtons code phoneCommands = go phoneCommands code (elemIndex (head code) phoneButtons)
  where
    go _ _ Nothing = []
    go phoneCommands code (Just index)
      -- As 1 has one value, and as phones did - return 1 as many times as it was pressed.
      | head code == '1' = code
      -- Get the command by matching the number of the same presses in the cluster to the infinite loop of command values
      | True = [cycle (phoneCommands !! index) !! (length code-1)]
