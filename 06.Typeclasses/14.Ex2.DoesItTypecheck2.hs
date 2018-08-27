data Mood = Blah
          | Woot
            deriving Show

instance Eq Mood where
    (==) Blah Blah = True
    (==) Woot Woot = True
    (==) _ _ = False
            
settleDown x = if x == Woot
                  then Blah
                  else x
