{-# OPTIONS_GHC -Wall #-}

module Main (main) where

import Control.Arrow
import Data.List
import Data.Ord

main :: IO ()
main = print answer

cycleLength :: Int -> Int
cycleLength d = cycleLength' 1 []
  where cycleLength' 0 _ = 0
        cycleLength' r remainders =
          case elemIndex r remainders of
            Just i -> length remainders - i
            Nothing -> cycleLength' (rem (r * 10) d) (remainders ++ [r])

answer :: Int
answer = fst . maximumBy (comparing snd) $ map (id &&& cycleLength) [1..999]
