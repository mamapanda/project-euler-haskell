{-# OPTIONS_GHC -Wall #-}

module Main (main) where

import Control.Monad
import Data.List
-- | package array
import qualified Data.Array.ST as Array
import Data.Array.Unboxed ((!))
import qualified Data.Array.Unboxed as Array

main :: IO ()
main = print answer

nDigits :: Int -> Int
nDigits = (+ 1) . (floor :: Double -> Int) . logBase 10 . fromIntegral

digits :: Int -> [Int]
digits = reverse . digits'
  where digits' 0 = []
        digits' x = digit:digits' x'
          where (x', digit) = quotRem x 10

nPandigital :: Int -> Bool
nPandigital x = sort (digits x) == [1..(nDigits x)]

eSieve :: Int -> Array.UArray Int Bool
eSieve bound = Array.runSTUArray $ do
  sieve <- Array.newListArray (0, bound) (False:False:repeat True)
  forM_ [2..bound] $ \i -> do
    prime <- Array.readArray sieve i
    when prime $
      forM_ [(i * 2),(i * 3)..bound] $ \i' ->
      Array.writeArray sieve i' False
  return sieve

maxPandigital :: Int
maxPandigital = 7654321

answer :: Int
answer = head [ x
              | x <- [maxPandigital,(maxPandigital - 1)..1]
              , sieve!x && nPandigital x
              ]
  where sieve = eSieve maxPandigital
