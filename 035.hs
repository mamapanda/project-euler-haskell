{-# OPTIONS_GHC -Wall #-}

module Main (main) where

-- | package array
import Data.Array.Unboxed ((!), (//))
import qualified Data.Array.Unboxed as Array

main :: IO ()
main = print answer

eSieve :: Int -> Array.UArray Int Bool
eSieve bound = foldl f initialSieve [2..bound]
  where initialSieve = Array.listArray (0, bound) (False:False:repeat True)
        f sieve i
          | sieve!i = sieve//[ (i', False)
                             | i' <- [(i * 2),(i * 3)..bound]
                             ]
          | otherwise = sieve :: Array.UArray Int Bool

nDigits :: Int -> Int
nDigits = (+ 1) . (floor :: Double -> Int) . logBase 10 . fromIntegral

cycleNumber :: Int -> Int
cycleNumber n = digit * 10 ^ (nDigits n - 1) + n'
  where (n', digit) = quotRem n 10

cycles :: Int -> [Int]
cycles n = scanr (const cycleNumber) n [2..(nDigits n)]

circularPrime :: Array.UArray Int Bool -> Int -> Bool
circularPrime sieve n = sieve!n && all (sieve!) (cycles n)

answer :: Int
answer = length $ filter (circularPrime sieve) [0..999999]
  where sieve = eSieve 999999
