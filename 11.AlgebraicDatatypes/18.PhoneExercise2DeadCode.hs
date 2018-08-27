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

