data Quantum = Yes
             | No
             | Both
             deriving (Eq, Show)


convert :: Quantum -> Bool
convert Yes = True
convert _ = False

convert2 :: Quantum -> Bool
convert2 Yes = True
convert2 Both = True
convert2 _ = False

convert3 :: Quantum -> Bool
convert3 Yes = True
convert3 Both = True
convert3 _ = True

convert4 :: Quantum -> Bool
convert4 Yes = True
convert4 Both = False
convert4 _ = True

convert5 :: Quantum -> Bool
convert5 Yes = False
convert5 Both = True
convert5 _ = True

convert6 :: Quantum -> Bool
convert6 Yes = False
convert6 Both = True
convert6 _ = False

convert7 :: Quantum -> Bool
convert7 Yes = False
convert7 Both = True
convert7 _ = True

convert8 :: Quantum -> Bool
convert8 Yes = False
convert8 Both = False
convert8 _ = False
