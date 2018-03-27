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

data Programmer = Programmer { os :: OperatingSystem
                             , lang :: ProgLang }
                            deriving (Eq, Show)

allOperatingSystems :: [OperatingSystem]
allOperatingSystems =
    [ GnuPlusLinux
    , OpenBSDPlusNevermindJustBSDStill
    , Mac
    , Windows
    ]

allLanguages :: [ProgLang]
allLanguages = [Haskell, Agda, Idris, PureScript]

allProgrammers :: [OperatingSystem] -> [ProgLang] -> [Programmer]
allProgrammers oses langs = tuplesIntoProgrammers cartesianTuples
    where
        cartesianTuples = ([(x,y) | x <- oses, y <- langs])
        tuplesIntoProgrammers = fmap (\ (x,y) -> Programmer x y)
