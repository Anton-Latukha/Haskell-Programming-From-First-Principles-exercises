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

phoneButtons = "*#0123456789"
phoneCommands = ["^*", ".,#", " +_0", "1", "abc2", "def3", "ghi4", "jkl5", "mno6", "pqrs7", "tuv8", "wxyz9"]

phoneDataModel = zip phoneButtons phoneCommands

-- Validate sequence element as a legitimate button
validButton :: Phone -> Button -> Bool
validButton phone button = elem button phoneButtons

-- Takes sequence of button presses and returnes list of subsequent clusters of the same presses
splitToSameTaps :: [Button] -> [[Button]]
splitToSameTaps [] = [[]]
splitToSameTaps str = sameTapsCluster ++ reminder
  where
    sameTaps = takeWhile (== head str) str
    sameTapsCluster = [sameTaps]
    reminder = splitToSameTaps (drop (length sameTaps) str)

-- Translate cluster of the same button presses into according command
sameTaps :: Phone -> [Button] -> [Char]
sameTaps phone str = go phone str (elemIndex (head str) phoneButtons)
  where
    go _ _ Nothing = []
    go phone str (Just index)
      | head str == '1' = str
      | True = [cycle (phoneCommands !! index) !! (length str-1)]
