\begin{code}
{-# LANGUAGE UnicodeSyntax #-}

module ShortExMultiplication where

import Prelude.Unicode

import Test.Hspec

rMult ∷ (Eq a, Num a) ⇒ a → a → a
rMult a 0 = 0
rMult a b = a + rMult a (b-1)

main ∷ IO ()
main = hspec $
  describe "Custom recursive multiplication" $ do
    it "1 ⋅ 0 = 0" $ rMult 1 0 `shouldBe` 0
    it "2 ⋅ 0 = 0" $ rMult 2 0 `shouldBe` 0
    it "255 ⋅ 0 = 0" $ rMult 255 0 `shouldBe` 0
    it "0 ⋅ 1 = 0" $ rMult 0 1 `shouldBe` 0
    it "0 ⋅ 2 = 0" $ rMult 0 2 `shouldBe` 0
    it "0 ⋅ 255 = 0" $ rMult 0 255 `shouldBe` 0
    it "1 ⋅ 1 = 1" $ rMult 1 1 `shouldBe` 1
    it "2 ⋅ 2 = 4" $ rMult 2 2 `shouldBe` 4
    it "255 ⋅ 255 = 4" $ rMult 255 255 `shouldBe` 65025
\end{code}
