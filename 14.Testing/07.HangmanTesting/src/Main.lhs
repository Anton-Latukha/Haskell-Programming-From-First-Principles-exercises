\begin{code}
{-# LANGUAGE UnicodeSyntax #-}

module Main where

import Prelude.Unicode

import Control.Monad (forever, when)
import Data.Char (toLower)
import Data.Maybe (isJust)
import Data.List (intersperse)
import System.Exit (exitSuccess)
import System.Random (randomRIO)

import Test.QuickCheck

type WordList = [String]

allWords ∷ IO WordList
allWords = lines <$> readFile "data/dict.txt"

minWordLength ∷ Int
minWordLength = 4

maxWordLength ∷ Int
maxWordLength = 8

gameWords ∷ IO WordList
gameWords = filter gameLength <$> allWords
  where gameLength w =
          let l = length (w ∷ String)
          in     l >= minWordLength
              && l <  maxWordLength

randomWord ∷ WordList → IO String
randomWord wl = do
  randomIndex ← randomRIO (0, length wl - 1)
  return $ wl !! randomIndex

randomWord' ∷ IO String
randomWord' = gameWords >>= randomWord

data Puzzle =
  Puzzle String [Maybe Char] String

instance Arbitrary Puzzle where
  arbitrary = do
    s1 ← arbitrary
    m1 ← return (take (length s1) (repeat Nothing))
    s2 ← return ([])
    return (Puzzle s1 m1 s2)

instance Show Puzzle where
  show (Puzzle _ guessed played) =
    intersperse ' ' (fmap renderPuzzleChar guessed)
    ++ " Played so far: " ++ played

newPuzzle ∷ String → Puzzle
newPuzzle word = Puzzle word (fmap (const Nothing) word) []

isInWord ∷ Puzzle → Char → Bool
isInWord (Puzzle word _ _) char = char ∈ word

wasPlayed ∷ Puzzle → Char → Bool
wasPlayed (Puzzle _ _ playedList ) letter = letter ∈ playedList

renderPuzzleChar ∷ Maybe Char → Char
renderPuzzleChar Nothing = '_'
renderPuzzleChar (Just letter) = letter

fillInCharacter ∷ Puzzle → Char → Puzzle
fillInCharacter (Puzzle word guessed played) char = Puzzle word newGuessed (char : played)
  where zipper playedNow wordChar blank =
          if wordChar ≡ playedNow
          then Just wordChar
          else blank
        newGuessed = zipWith (zipper char) word guessed

handleGuess ∷ Puzzle → Char → IO Puzzle
handleGuess puzzle guess = do
  putStrLn $ "Your guess was: " ++ [guess]
  case (isInWord puzzle guess, wasPlayed puzzle guess) of
    (_, True) → do
      putStrLn "Letter was already guessed."
      return puzzle
    (True, _) → do
      putStrLn "You guessed! Filling letter in."
      return (fillInCharacter puzzle guess)
    (False, _) → do
      putStrLn "Letter wasn't in the word, try again."
      return (fillInCharacter puzzle guess)

gameOver ∷ Puzzle → IO ()
gameOver (Puzzle word _ guessed) =
  when (length guessed > 18) $
    do putStrLn "You lose!"
       putStrLn $ "The word was: " ++ word ++ "."
       exitSuccess

gameWin ∷ Puzzle → IO ()
gameWin (Puzzle _ maybeGuessed _) =
  when (all isJust maybeGuessed) $
    do putStrLn "Wow! You win."
       exitSuccess

runGame ∷ Puzzle → IO ()
runGame puzzle = forever $ do
  gameOver puzzle
  gameWin puzzle
  putStrLn $ "Current puzzle is: " ++ show puzzle
  putStr "Guess a letter: "
  guess ← getLine
  case guess of
    [char] → handleGuess puzzle char >>= runGame
    _      → putStrLn "Your guess must be a single character"

-- prop_fillInCharacter ∷ Puzzle → Char → Bool
-- prop_fillInCharacter puzzle char = 

prop_fillInCharacterRun = quickCheck (fillInCharacter)

main ∷ IO ()
main = do
  word ← randomWord'
  let puzzle =
        newPuzzle (fmap toLower word)
  runGame puzzle
\end{code}
