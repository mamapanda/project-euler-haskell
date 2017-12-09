{-# OPTIONS_GHC -Wall #-}

module Main (main) where

import Data.Ix
-- | package vector
import Data.Vector ((!))
import qualified Data.Vector as Vector

main :: IO ()
main = print answer

limit :: Int
limit = 999999

collatz :: Integer -> Integer
collatz x
  | even x = quot x 2
  | otherwise = 3 * x + 1

collatzLength :: Integer -> Int
collatzLength 0 = 0
collatzLength 1 = 1
collatzLength x = 1 + if inRange (0, fromIntegral limit) next
                      then collatzLengths!fromIntegral next
                      else collatzLength next
  where next = collatz x

collatzLengths :: Vector.Vector Int
collatzLengths = Vector.generate (limit + 1) (collatzLength . fromIntegral)

answer :: Int
answer = Vector.maxIndex collatzLengths
