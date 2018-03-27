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

nineToFive :: Programmer
nineToFive = Programmer { os = Mac
                        , lang = Haskell }
                        -- We can reorder stuff
                        -- when we use record syntax
feelingWizardly :: Programmer
feelingWizardly = Programmer { lang = Agda
                             , os = GnuPlusLinux }

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
allProgrammers oses langs = fmap (\ x -> Programmer fst(x) snd(x)) (zipWith (,) oses langs)
