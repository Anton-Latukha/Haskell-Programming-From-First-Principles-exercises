import Test.Hspec

rMult :: Integral a => a -> a -> a
rMult x 0 = 0
rMult x y = x + rMult x (y - 1)

main :: IO ()
main = hspec $ do
  describe "Multiplication by recursion" $ do
    it "0*0 should be 0" $ do
      rMult 0 0 `shouldBe` 0
    it "3*0 should be 0" $ do
      rMult 3 0 `shouldBe` 0
    it "0*3 should be 0" $ do
      rMult 0 3 `shouldBe` 0
    it "1*1 should be 1" $ do
      rMult 1 1 `shouldBe` 1
    it "4*1 should be 0" $ do
      rMult 1 4 `shouldBe` 4
    it "1*4 should be 0" $ do
      rMult 4 1 `shouldBe` 4
    it "69*72 should be 4968" $ do
      rMult 69 72 `shouldBe` 4968
