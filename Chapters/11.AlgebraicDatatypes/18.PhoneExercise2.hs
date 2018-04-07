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
type Values = String
data Phone = Phone [(Button, Values)]

-- Allowed buttons
phoneButtons :: [Button]
phoneButtons = "*#0123456789"

-- Index+1 == number of button presses
phoneCommands :: [Values]
phoneCommands = ["^*", ".,#", " +_0", "1", "abc2", "def3", "ghi4", "jkl5", "mno6", "pqrs7", "tuv8", "wxyz9"]

-- Create a consistent data model, but only if lists of buttons and commands have same length
phoneDataModel :: [Button] -> [Values] -> Phone
phoneDataModel phoneButtons phoneCommands
  | length phoneButtons == length phoneCommands = Phone (zip phoneButtons phoneCommands)
  | True = Phone []

-- Validate sequence element as a legitimate button
validButton :: [Button] -> Button -> Bool
validButton phoneButtons button = elem button phoneButtons

------ Conversion of Button presses code to commands (text)

-- Takes sequence of button presses and returnes list of subsequent clusters of the same presses
splitToSameTaps :: [Button] -> [[Button]]
splitToSameTaps [] = [[]]
splitToSameTaps str = sameTapsCluster ++ reminder
  where
    sameTaps = takeWhile (== head str) str
    sameTapsCluster = [sameTaps]
    reminder = splitToSameTaps (drop (length sameTaps) str)

-- Translate cluster of the same button presses into according command
sameTaps :: [Button] -> [Button] -> [Values] -> [Char]
sameTaps phoneButtons code phoneCommands = go phoneCommands code (elemIndex (head code) phoneButtons)
  where
    go _ _ Nothing = []
    go phoneCommands code (Just index)
      -- As 1 has one value, and as phones did - return 1 as many times as it was pressed.
      | head code == '1' = code
      -- Get the command by matching the number of the same presses in the cluster to the infinite loop of command values
      | True = [cycle (phoneCommands !! index) !! (length code-1)]

------ Conversion from text (commands) to Button presses

-- Create a reverse (symbol -> button code) dictionary
codesArr :: [[[Button]]]
codesArr = fmap (\ value -> fmap (\ c -> take ((fromMaybe 5 (elemIndex c value)) + 1) (repeat (phoneButtons !! fromMaybe 5 (elemIndex value phoneCommands)))) value) phoneCommands

-- phoneCommands is [[Char]], codesArr is [[[Button]]]
dictionary = zip (concat phoneCommands) (concat codesArr)


convTextToCodes :: String -> [(Char,[Button])] -> [Maybe [Button]]
convTextToCodes text dictionary = fmap (\ char -> go dictionary char) text
  where
    go dictionary char
      | elem char (fmap fst dictionary) = lookup char dictionary
      | elem char ['A'..'Z'] = Just (['*' :: Button])
      | True = Just ""


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

printT = (fmap (\ text -> convTextToCodes text dictionary) convo)
