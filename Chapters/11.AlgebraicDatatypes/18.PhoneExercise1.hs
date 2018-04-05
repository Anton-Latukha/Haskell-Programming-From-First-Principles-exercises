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

phone = [
  ('*', "^*"),
  ('#', ".,#"),
  ('0', " +_0"),
  ('1', "1"),
  ('2', "abc2"),
  ('3', "def3"),
  ('4', "ghi4"),
  ('5', "jkl5"),
  ('6', "mno6"),
  ('7', "pqrs7"),
  ('8', "tuv8"),
  ('9', "wxyz9")
  ]

validButton :: Button -> Bool
validButton button = elem button "*#0123456789"

validTaps :: [Button] -> Bool

-- Valid presses: 1 and up
type Presses = Int

sameTaps :: Phone -> String -> Char
sameTaps phone str
  | head str == '1' = str
  | True =

    elemIndex (fst (unzip phone))
