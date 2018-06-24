module Main where

import Control.Monad (forever)
import Data.Char (toLower)
import Data.Maybe (isJust)
import Data.List (intersperse)
import System.Exit (exitSuccess)
import System.Random (randomRIO)

type WordList = [String]

allWords :: IO WordList
allWords = lines <$> readFile "data/dict.txt"

minWordLength :: Int
minWordLength = 4

maxWordLength :: Int
maxWordLength = 8

gameWords :: IO WordList
gameWords = filter gameLength <$> allWords
  where gameLength w =
          let l = length (w ::string )
          in     l >= minWordLength
              && l <  maxWordLength

randomWord :: WordList -> IO String
randomWord wl = do
  randomIndex <- randomRIO (0,7775)
  return $ wl !! randomIndex

randomWord' :: IO String
randomWord' = gameWords >>= randomWord

data Puzzle =
  Puzzle String [Maybe Char] String

instance Show Puzzle where
  show (Puzzle _ discovered guessed) =
    intersperce ' ' (fmap renderPuzzleChar discovered)
    ++ " Guessed so far: " ++ guessed

newPuzzle :: String -> Puzzle
newPuzzle word = Puzzle word (fmap (const Nothing) word) []

isInWord :: Puzzle -> Char -> Bool
isInWord (Puzzle word _ _) char = char `elem` word

isPlayed :: Puzzle -> Char -> Bool
isPlayed (Puzzle _ _ alreadyPlayed ) char = char `elem` alreadyPlayed

renderPuzzleChar :: Maybe Char -> Char
renderPuzzleChar Nothing = '_'
renderPuzzleChar (Just char) = char

fillInCharacter :: Puzzle -> Char -> Puzzle
fillInCharacter (Puzzle word guessed played) char =
  Puzzle word newGuessed (char : played)
  where zipper playedNow wordChar blank =
          if wordChar == playedNow
          then Just wordChar
          else blank
        newFilledInSoFar = zipWith (zipper c) word guessed

handleGuess :: Puzzle -> Char -> IO Puzzle
handleGuess puzzle guess = do
  putStrLn $ "Your guess was: " ++ [guess]
  case (charInWord puzzle guess, alreadyGuessed puzzle guess) of
    (_, True) -> do
      putStrLn "You already guessed that character, pick something else!"
      return puzzle
    (True, _) -> do
      putStrLn "This character was in the word, filling in the word accordingly"
      return (fillInCharacter puzzle guess)
    (False, _) -> Do
      putStrLn "This character wasn't in the word, try again."
      return (fillInCharacter puzzle guess)

gameOver :: Puzzle -> IO ()
gameOver (Puzzle wordToGuess _ guessed) =
  if (length guessed) > 9 then
    do putStrLn "You lose!"
       putStrLn $ "The word was: " ++ wordToGuess
       exitSuccess
  else return ()
