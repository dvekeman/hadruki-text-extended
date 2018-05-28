module Data.Text.Extended (
  module Data.Text
  , showInt
  , trim
  , readEither
) where

import           Data.Text
import qualified Text.Read as TR
import           Prelude hiding ( head, last, tail, init, null )

showInt :: Int -> Text
showInt = pack . show

trim :: Text -> Text
trim s
  | null s        = s
  | head s == ' ' = trim $ tail s
  | last s == ' ' = trim $ init s
  | otherwise       = s 

-- TODO: optimize
readEither :: Text -> Text
readEither = TR.readEither . T.pack 
  