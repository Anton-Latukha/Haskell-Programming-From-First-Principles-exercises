data Person = Person

instance Show Person where
    show a = "Person"

printPerson :: Person -> IO()
printPerson person = putStrLn (show person)
