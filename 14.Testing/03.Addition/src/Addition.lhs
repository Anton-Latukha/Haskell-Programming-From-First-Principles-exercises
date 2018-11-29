\begin{code}
{-# LANGUAGE UnicodeSyntax #-}
module Addition where

import Test.Hspec

dividedBy :: Integral a => a -> a -> (a, a)
dividedBy num denom = go num denom 0
    where go n d count
           | n < d = (count, n)
           | True =
               go (n - d) d (count + 1)

main ∷ IO ()
main = hspec $
  describe "Addition" $ do
    it "1 + 1 is greater than 1" $ 1 + 1 > 1 `shouldBe` True
    it "2 + 2 is equal to 4" $ 2 + 2 `shouldBe` 4
    it "15 devided by 3 is 5" $ dividedBy 15 3 `shouldBe` (5, 0)
    it "22 devided by 5 is 4 reminder 3" $ dividedBy 22 5 `shouldBe` (4, 2)
\end{code}
