acronym :: String -> String
acronym str = [char | char <- str, elem char ['A'..'Z']]
