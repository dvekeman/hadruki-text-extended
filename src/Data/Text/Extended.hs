module Data.Text.Extended (
  module Data.Text
  , showText
  , showNum
  , readNum
  , showInt
  , readInt
  , trim
  , readEither
) where

import           Data.Either.Combinators
import           Data.Text
import qualified Text.Read as TR

import           Prelude hiding ( head, last, tail, init, null )

showText :: (Show a) => a -> Text
showText = pack . show

showNum :: (Show a, Num a) => a -> Text
showNum = pack . show

-- | deprecated, use showNum instead
showInt :: Int -> Text
showInt = showNum

-- | deprecated, use readNum instead
readNum :: (Read a, Num a) => Text -> a
readNum = read . unpack

readInt :: Text -> Int
readInt = readNum

nonBreakingSpace :: Char
nonBreakingSpace = ' '

trim :: Text -> Text
trim s
  | null s        = s
  | head s == ' ' || head s == nonBreakingSpace = trim $ tail s
  | last s == ' ' || last s == nonBreakingSpace = trim $ init s
  | otherwise       = s

-- TODO: optimize
readEither :: Read a => Text -> Either Text a
readEither = mapLeft pack . TR.readEither . unpack 
  