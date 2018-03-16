myFilter :: String -> [String] -> [String]
myFilter inputString tabooWords = [x | x <- (words inputString), not (elem x tabooWords)]
--myFilter "the brown dog was a goof" ["the", "a", "an"]
