\begin{code}
{-# LANGUAGE UnicodeSyntax #-}

module Main where

import Prelude.Unicode

data Cow = Cow
  { name ∷ String
  , age ∷ Int
  , weight ∷ Int
  } deriving (Eq, Show)

noEmpty ∷ String → Maybe String
noEmpty "" = Nothing
noEmpty str = Just str

noNegative ∷ Int → Maybe Int
noNegative n | n ≥ 0 = Just n
             | otherwise = Nothing

\end{code}

If Cow's name os Bess - must be under 500
Simplifying code at the same time.
\begin{code}
weightCheck ∷ Cow → Maybe Cow
weightCheck cow =
  if name cow ≡ "Bess" ∧ (weight cow) > 499
    then Nothing
    else Just cow

mkSphericalCow ∷ String
               → Int
               → Int
               → Maybe Cow
mkSphericalCow name age weight =
  case noEmpty name of
    Nothing → Nothing
    Just name →
      case noNegative age of
        Nothing → Nothing
        Just age →
          case noNegative weight of
            Nothing → Nothing
            Just weight →
              weightCheck (Cow name age weight)

mkSphericalCow'' ∷ String
                 → Int
                 → Int
                 → Maybe Cow
mkSphericalCow'' name age weight =
  noEmpty name >>=
  \ nameL →
    noNegative age >>=
    \ ageL →
      noNegative weight >>=
      \ weightL →
        weightCheck (Cow nameL ageL weightL)

mkSphericalCow' name age weight =
  do
    namem   ← noEmpty name
    agem    ← noNegative age
    weightm ← noNegative weight
    weightCheck (Cow namem agem weightm)

main ∷ IO ()
main = do
  print $ mkSphericalCow "Bess" 5 499
  print $ mkSphericalCow "Bess" 5 500
  print $ mkSphericalCow' "Bess" 5 499
  print $ mkSphericalCow' "Bess" 5 500
  print $ mkSphericalCow'' "Bess" 5 499
  print $ mkSphericalCow'' "Bess" 5 500

\end{code}
