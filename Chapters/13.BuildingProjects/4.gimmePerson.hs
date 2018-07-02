import Data.Either (either)

type Name = String
type Age = Integer

data Person =
  Person Name
         Age
  deriving (Show)

data PersonInvalid
  = NameEmpty
  | AgeTooLow
  | PersonInvalidUnknown String
  deriving (Eq, Show)

mkPerson :: Name -> Age -> Either PersonInvalid Person
mkPerson name age
  | name /= "" && age > 0 = Right $ Person name age
  | name == "" = Left NameEmpty
  | not (age > 0) = Left AgeTooLow
  | otherwise =
    Left $
    PersonInvalidUnknown $ "Name was: " ++ show name ++ " Age was: " ++ show age

gimmePerson :: IO ()
gimmePerson = do
  putStrLn "Please enter:"
  putStr "Name: "
  name <- getLine
  putStr "Age: "
  age <- getLine
  either
    (error . errorMessage)
    (\x -> putStrLn ("Yay! Succesfully got a person: " ++ (show x)))
    ((mkPerson name (read age :: Age)) :: Either PersonInvalid Person)
  where
    errorMessage :: PersonInvalid -> String
    errorMessage NameEmpty = "Error: Name of person is empty."
    errorMessage AgeTooLow = "Error: Age of person is <= 0."
    errorMessage (PersonInvalidUnknown errInfo) = "Error: Person data invalid."
