module PoemLines where


firstSen  = "Tyger Tyger, burning bright\n"
secondSen = "In the forests of the night\n"
thirdSen  = "What immortal hand or eye\n"
fourthSen = "Could frame thy fearful\
           \ symmetry?"

sentences = firstSen ++ secondSen
         ++ thirdSen ++ fourthSen


--myLines :: String -> [String]
--myLines = putStrLn sentences

myLines :: String -> [String]
myLines s = filter (not.null) (go s [[]])
    where
        go :: [Char] -> [[Char]] -> [[Char]]
        go s r
            -- When end of the list gets passed
            | s == [] = r
            -- Send the on input send a string that removes current word; then save the current word in list
            | True = go (dropWhile (=='\n') (dropWhile (/='\n') s)) (r++[(takeWhile (/='\n') s)])

-- What we want 'myLines sentences'
-- to equal
shouldEqual =
    [ "Tyger Tyger, burning bright"
    , "In the forests of the night"
    , "What immortal hand or eye"
    , "Could frame thy fearful symmetry?"
    ]
-- The main function here is a small test
-- to ensure you've written your function
-- correctly.
main :: IO ()
main =
    print $ "Are they equal? "
        ++ show (myLines sentences
        == shouldEqual)
