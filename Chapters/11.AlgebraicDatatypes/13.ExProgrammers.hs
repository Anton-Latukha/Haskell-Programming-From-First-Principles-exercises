data OperatingSystem = GnuPlusLinux
                     | OpenBSDPlusNevermindJustBSDStill
                     | Mac
                     | Windows
                    deriving (Eq, Show)

data ProgLang = Haskell
              | Agda
              | Idris
              | PureScript
deriving (Eq, Show)
data Programmer =
Programmer { os :: OperatingSystem
, lang :: ProgLang }
deriving (Eq, Show)
