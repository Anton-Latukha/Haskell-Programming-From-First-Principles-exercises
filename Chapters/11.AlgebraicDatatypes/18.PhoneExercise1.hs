-- ---------------------------
-- | 1      | 2 ABC | 3 DEF  |
-- ___________________________
-- | 4 GHI  | 5 JKL | 6 MNO  |
-- ---------------------------
-- | 7 PQRS | 8 TUV | 9 WXYZ |
-- ---------------------------
-- | * ^    | 0 + _ | # .,   |
-- ---------------------------

convertPhone :: String -> DaPhone [(Button, Values)]

data DaPhone = DaPhone 

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

                               -- valid Digit = "123456789*#"
data Button = '*' | '#' | '0' | '1' | '2' | '3' | '4' | '5' | '6' | '7' | '8' | '9'

-- Valid presses: 1 and up
type Presses = Int

reverseTaps :: DaPhone -> Char -> [(Digit, Presses)]
reverseTaps = undefined
-- assuming the default phone definition
-- 'a' -> [('2', 1)]
-- 'A' -> [('*', 1), ('2', 1)]

