-- Addition.hs
module Addition where

import Test.Hspec

main :: IO ()
main = hspec $
  describe "Addition" $
    it "1 + 1 is greater than 1" $ 1 + 1 > 1 `shouldBe` True
