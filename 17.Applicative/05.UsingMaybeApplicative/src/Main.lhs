\begin{code}
{-# LANGUAGE UnicodeSyntax #-}

module Main where

import Prelude.Unicode


validateLength ∷ Int → String → Maybe String
validateLength maxLen s =
  if maxLen > (length s)
    then Just s
    else Nothing

newtype Name = Name String
  deriving (Eq, Show)
newtype Address = Address String
  deriving (Eq, Show)

mkName ∷ String → Maybe Name
mkName s = fmap Name $ validateLength 25 s

mkAddress ∷ String → Maybe Address
mkAddress a = fmap Address $ validateLength 100 a

-- Smart constructor for a Person

data Person = Person Name Address
  deriving (Eq, Show)

mkPerson ∷ String → String → Maybe Person
mkPerson n a =
  case mkName n of
    Nothing → Nothing
    Just n' →
      case mkAddress a of
        Nothing → Nothing
        Just a' →
          Just $ Person n' a'

mkPersonApplicative ∷ String → String → Maybe Person
mkPersonApplicative n a = Person <$> mkName n <*> mkAddress a

main ∷ IO ()
main = print $ mkPersonApplicative "Anton" "Lambda Land, Currie Road"
\end{code}
