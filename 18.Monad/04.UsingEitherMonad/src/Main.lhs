\begin{code}
{-# LANGUAGE UnicodeSyntax #-}

module EitherMonad where

import Prelude.Unicode


type Founded = Int
type Coders = Int

data SoftwareShop =
  Shop
  { founded ∷ Founded
  , programmers ∷ Coders
  } deriving (Eq, Show)

data FoundedError
  = NegativeYears Founded
  | TooManyYears Founded
  | NegativeCoders Coders
  | TooManyCoders Coders
  | TooManyCodersForYears Founded Coders
  deriving (Eq, Show)

validateFounded ∷ Int → Either FoundedError Founded
validateFounded n
  | n < 0     = Left $ NegativeYears n
  | n > 200   = Left $ TooManyYears n
  | otherwise = Right n

validateCoders ∷ Int → Either FoundedError Coders
validateCoders n
  | n < 0     = Left $ NegativeCoders n
  | n > 5000  = Left $ TooManyCoders n
  | otherwise = Right n

mkSoftware ∷ Int → Int → Either FoundedError SoftwareShop
mkSoftware years coders = do
  founded     ← validateFounded years
  programmers ← validateCoders coders
  case () of _
               | programmers < 5             → Right $ Shop founded programmers
               | programmers > div founded 3 → Left  $ TooManyCodersForYears founded programmers
               | otherwise                   → Right $ Shop founded programmers

main ∷ IO ()
main = putStrLn "Please run mkSoftware :: Int -> Int -> Either FoundedError SoftwareShop.\n" ++
                "mkSoftware was changed closer to reality."
\end{code}
