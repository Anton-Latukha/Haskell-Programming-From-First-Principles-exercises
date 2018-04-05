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

type Button = Char
type Values = String
data Phone = Phone [(Button, Values)]

phoneButtons :: [Button]
phoneButtons = "*#0123456789"
phoneCommands :: [Values]
phoneCommands = ["^*", ".,#", " +_0", "1", "abc2", "def3", "ghi4", "jkl5", "mno6", "pqrs7", "tuv8", "wxyz9"]

-- If lists of buttons and commands have same number of indexes - create a consistent data model
phoneDataModel :: [Button] -> [Values] -> Phone
phoneDataModel phoneButtons phoneCommands
  | length phoneButtons == length phoneCommands = Phone (zip phoneButtons phoneCommands)
  | True = Phone []

-- Validate sequence element as a legitimate button
validButton :: [Button] -> Button -> Bool
validButton phoneButtons button = elem button phoneButtons

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
      | True = [cycle (phoneCommands !! index) !! (length str-1)]
