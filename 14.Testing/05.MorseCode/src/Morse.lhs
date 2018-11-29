Marks of beginning and end of code are used to place code in *.lhs files

To prettify and better understand code - let's enable Unicode symbols with next pragma.
Writing is too intuitive to explain.
\begin{code}
{-# LANGUAGE UnicodeSyntax #-}
\end{code}

Now let's begin just writing module code:
\begin{code}
module Morse
  ( Morse
  , charToMorse
  , morseToChar
  , stringToMorse
  , letterToMorse
  , morseToLetter
  ) where

import qualified Data.Map as M

type Morse = String

letterToMorse :: (M.Map Char Morse)
letterToMorse = M.fromList
  [ ('a', ".-")
  , ('b', "-...")
  , ('c', "-.-.")
  , ('d', "-..")
  , ('e', ".")
  , ('f', "..-.")
  , ('g', "--.")
  , ('h', "....")
  , ('i', "..")
  , ('j', ".---")
  , ('k', "-.-")
  , ('l', ".-..")
  , ('m', "--")
  , ('n', "-.")
  , ('o', "---")
  , ('p', ".--.")
  , ('q', "--.-")
  , ('r', ".-.")
  , ('s', "...")
  , ('t', "-")
  , ('u', "..-")
  , ('v', "...-")
  , ('w', ".--")
  , ('x', "-..-")
  , ('y', "-.--")
  , ('z', "--..")
  , ('1', ".----")
  , ('2', "..---")
  , ('3', "...--")
  , ('4', "....-")
  , ('5', ".....")
  , ('6', "-....")
  , ('7', "--...")
  , ('8', "---..")
  , ('9', "----.")
  , ('0', "-----")
  ]

-- Data.Map 'flodWithKey' is deprecated, "as of version 0.4, replaced by 'foldrWithKey'."
morseToLetter ∷ M.Map Morse Char
morseToLetter
  = M.foldrWithKey (flip M.insert) M.empty letterToMorse

charToMorse ∷ Char → Maybe Morse
charToMorse c
  = M.lookup c letterToMorse

stringToMorse ∷ String → Maybe [Morse]
stringToMorse s
  = sequence $ fmap charToMorse s

morseToChar ∷ Morse → Maybe Char
morseToChar m
  = M.lookup m morseToLetter
\end{code}
