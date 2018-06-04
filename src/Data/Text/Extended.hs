module Data.Text.Extended (
  module Data.Text
  , showInt
  , readInt
  , trim
  , readEither
) where

import           Data.Either.Combinators
import           Data.Text
import qualified Text.Read as TR

import           Prelude hiding ( head, last, tail, init, null )

showInt :: Int -> Text
showInt = pack . show

readInt :: Text -> Int
readInt = read . unpack

trim :: Text -> Text
trim s
  | null s        = s
  | head s == ' ' = trim $ tail s
  | last s == ' ' = trim $ init s
  | otherwise       = s 

-- TODO: optimize
readEither :: Read a => Text -> Either Text a
readEither = mapLeft pack . TR.readEither . unpack 
  