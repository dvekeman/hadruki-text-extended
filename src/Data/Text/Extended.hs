module Data.Text.Extended (
  module Data.Text
  , showInt
  , trim
) where

import           Data.Text
import           Prelude hiding ( head, last, tail, init, null )

showInt :: Int -> Text
showInt = pack . show

trim :: Text -> Text
trim s
  | null s        = s
  | head s == ' ' = trim $ tail s
  | last s == ' ' = trim $ init s
  | otherwise       = s 