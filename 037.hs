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

truncatel :: Int -> Int
truncatel x = rem x (10 ^ (nDigits x - 1))

truncater :: Int -> Int
truncater = flip quot 10

truncates' :: (Int -> Int) -> Int -> [Int]
truncates' f x
  | x < 10 = []
  | otherwise = x':truncates' f x'
  where x' = f x

truncatels :: Int -> [Int]
truncatels = truncates' truncatel

truncaters :: Int -> [Int]
truncaters = truncates' truncater

truncates :: Int -> [Int]
truncates x = x:truncatels x ++ truncaters x

answer :: Int
answer = sum [ x
             | x <- [10..1000000]
             , all (sieve!) (truncates x)
             ]
  where sieve = eSieve 1000000
