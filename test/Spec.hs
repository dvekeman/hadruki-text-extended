{-# LANGUAGE OverloadedStrings #-}

import Test.Hspec
import qualified Data.Text.Extended as T

main :: IO ()
main = hspec $ do
  describe "Data.Text.Extended.trim" $ do
    it "can trim empty strings" $
      T.trim "" `shouldBe` ("" :: T.Text)
    it "can trim non-empty strings with a leading spaces" $ 
      T.trim " blah" `shouldBe` ("blah" :: T.Text)
    it "can trim non-empty strings with a trailing spaces" $ 
      T.trim "blah " `shouldBe` ("blah" :: T.Text)
    it "can trim non-empty strings with leading spaces" $ 
      T.trim "   blah" `shouldBe` ("blah" :: T.Text)
    it "can trim non-empty strings with trailing spaces" $ 
      T.trim "blah       " `shouldBe` ("blah" :: T.Text)
    it "can trim non-empty strings without leading or trailing spaces" $ 
      T.trim "blah" `shouldBe` ("blah" :: T.Text)
    it "can trim non-empty strings without leading or trailing spaces but with spaces in between" $ 
      T.trim "je m'appelle Claude" `shouldBe` ("je m'appelle Claude" :: T.Text)

  describe "Data.Text.Extended.trim" $ do
    it "can convert integers to text" $
      T.showInt 42 `shouldBe` ("42" :: T.Text)
    it "can convert negative integers to text" $
      T.showInt (-42) `shouldBe` ("-42" :: T.Text)
