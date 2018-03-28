data Quantum = Yes
             | No
             | Both
             deriving (Eq, Show)

quantSum1 :: Either Quantum Quantum
quantSum1 = Right Yes

quantSum2 :: Either Quantum Quantum
quantSum2 = Right No

quantSum3 :: Either Quantum Quantum
quantSum3 = Right Both

quantSum4 :: Either Quantum Quantum
quantSum4 = Left Yes

quantSum5 :: Either Quantum Quantum
quantSum5 = Left No

quantSum6 :: Either Quantum Quantum
quantSum6 = Left Both

quantProd1 :: (Quantum, Quantum)
quantProd1 = (Yes, Yes)

quantProd2 :: (Quantum, Quantum)
quantProd2 = (Yes, No)

quantProd3 :: (Quantum, Quantum)
quantProd3 = (Yes, Both)

quantProd4 :: (Quantum, Quantum)
quantProd4 = (No, Yes)

quantProd5 :: (Quantum, Quantum)
quantProd5 = (No, No)

quantProd6 :: (Quantum, Quantum)
quantProd6 = (No, Both)

quantProd7 :: (Quantum, Quantum)
quantProd7 = (Both, Yes)

quantProd8 :: (Quantum, Quantum)
quantProd8 = (Both, No)

quantProd9 :: (Quantum, Quantum)
quantProd9 = (Both, Both)

quantFlip1 :: Quantum -> Quantum
quantFlip1 Yes = Yes
quantFlip1 No = Yes
quantFlip1 Both = Yes

quantFlip2 :: Quantum -> Quantum
quantFlip2 Yes = Yes
quantFlip2 No = Yes
quantFlip2 Both = No

quantFlip3 :: Quantum -> Quantum
quantFlip3 Yes = Yes
quantFlip3 No = Yes
quantFlip3 Both = Both

quantFlip4 :: Quantum -> Quantum
quantFlip4 Yes = Yes
quantFlip4 No = No
quantFlip4 Both = Yes

quantFlip5 :: Quantum -> Quantum
quantFlip5 Yes = Yes
quantFlip5 No = No
quantFlip5 Both = No

quantFlip6 :: Quantum -> Quantum
quantFlip6 Yes = Yes
quantFlip6 No = No
quantFlip6 Both = Both

quantFlip7 :: Quantum -> Quantum
quantFlip7 Yes = Yes
quantFlip7 No = Both
quantFlip7 Both = Yes

quantFlip8 :: Quantum -> Quantum
quantFlip8 Yes = Yes
quantFlip8 No = Both
quantFlip8 Both = No

quantFlip9 :: Quantum -> Quantum
quantFlip9 Yes = Yes
quantFlip9 No = Both
quantFlip9 Both = Both

quantFlip10 :: Quantum -> Quantum
quantFlip10 Yes = No
quantFlip10 No = Yes
quantFlip10 Both = Yes

quantFlip11 :: Quantum -> Quantum
quantFlip11 Yes = No
quantFlip11 No = Yes
quantFlip11 Both = No

quantFlip12 :: Quantum -> Quantum
quantFlip12 Yes = No
quantFlip12 No = Yes
quantFlip12 Both = Both

quantFlip13 :: Quantum -> Quantum
quantFlip13 Yes = No
quantFlip13 No = No
quantFlip13 Both = Yes

quantFlip14 :: Quantum -> Quantum
quantFlip14 Yes = No
quantFlip14 No = No
quantFlip14 Both = No

quantFlip15 :: Quantum -> Quantum
quantFlip15 Yes = No
quantFlip15 No = No
quantFlip15 Both = Both

quantFlip16 :: Quantum -> Quantum
quantFlip16 Yes = No
quantFlip16 No = Both
quantFlip16 Both = Yes

quantFlip17 :: Quantum -> Quantum
quantFlip17 Yes = No
quantFlip17 No = Both
quantFlip17 Both = No

quantFlip18 :: Quantum -> Quantum
quantFlip18 Yes = No
quantFlip18 No = Both
quantFlip18 Both = Both

quantFlip19 :: Quantum -> Quantum
quantFlip19 Yes = Both
quantFlip19 No = Yes
quantFlip19 Both = Yes

quantFlip20 :: Quantum -> Quantum
quantFlip20 Yes = Both
quantFlip20 No = Yes
quantFlip20 Both = No

quantFlip21 :: Quantum -> Quantum
quantFlip21 Yes = Both
quantFlip21 No = Yes
quantFlip21 Both = Both

quantFlip22 :: Quantum -> Quantum
quantFlip22 Yes = Both
quantFlip22 No = No
quantFlip22 Both = Yes

quantFlip23 :: Quantum -> Quantum
quantFlip23 Yes = Both
quantFlip23 No = No
quantFlip23 Both = No

quantFlip24 :: Quantum -> Quantum
quantFlip24 Yes = Both
quantFlip24 No = No
quantFlip24 Both = Both

quantFlip25 :: Quantum -> Quantum
quantFlip25 Yes = Both
quantFlip25 No = Both
quantFlip25 Both = Yes

quantFlip26 :: Quantum -> Quantum
quantFlip26 Yes = Both
quantFlip26 No = Both
quantFlip26 Both = No

quantFlip27 :: Quantum -> Quantum
quantFlip27 Yes = Both
quantFlip27 No = Both
quantFlip27 Both = Both
