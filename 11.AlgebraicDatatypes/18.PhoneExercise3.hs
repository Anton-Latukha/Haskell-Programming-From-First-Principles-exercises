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


main :: IO()
main = do
  mapM_ putStrLn ((fmap (\ text -> convTextToCodes dictionarySymbolToButtons text) convo))
  mapM_ print ((fmap (\ text -> fingerTaps dictionarySymbolToButtons text) convo))
