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
    it "can trim non-breaking spaces" $  -- "abc\160"
      T.trim "abc " `shouldBe` ("abc" :: T.Text)

  describe "Data.Text.Extended.showInt" $ do
    it "can convert integers to text" $
      T.showInt 42 `shouldBe` ("42" :: T.Text)
    it "can convert negative integers to text" $
      T.showInt (-42) `shouldBe` ("-42" :: T.Text)

  describe "Data.Text.Extended.readInt" $ do
    it "can convert text to integers" $
      T.readInt "42" `shouldBe` (42 :: Int)
    it "can convert negative integers to text" $
      T.readInt "-42" `shouldBe` ((-42) :: Int)

  describe "Data.Text.Extended.readEither" $ do
    it "can convert text to integers" $
      T.readEither "42" `shouldBe` Right 42
    it "can convert negative integers to text" $
      T.readEither "-42" `shouldBe` Right (-42)
