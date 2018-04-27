module Data.Text.Extended (
  module Data.Text
  , showInt
) where

import           Data.Text

showInt :: Int -> Text
showInt = pack . show