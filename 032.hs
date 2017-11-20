{-# OPTIONS_GHC -Wall #-}

module Main (main) where

import Data.List
-- | package containers
import qualified Data.IntSet as IntSet

main :: IO ()
main = print answer

nDigits :: Int -> Int
nDigits = (+ 1) . (floor :: Double -> Int) . logBase 10 . fromIntegral

digits :: Int -> [Int]
digits = reverse . digits'
  where digits' 0 = []
        digits' x = digit:digits' x'
          where (x', digit) = quotRem x 10

pandigital :: Int -> Bool
pandigital = (== [1..9]) . sort . digits

connect :: Int -> Int -> Int
connect x y = x * 10 ^ nDigits y + y

copandigital :: [Int] -> Bool
copandigital = pandigital . foldl1 connect

pandigitalProducts :: [Int] -> [Int] -> IntSet.IntSet
pandigitalProducts xs ys = IntSet.fromList [ prod
                                           | x <- xs
                                           , y <- takeWhile (<= quot 9999 x) ys
                                           , let prod = x * y
                                                   , copandigital [x, y, prod]
                                           ]

answer :: Int
answer = sum' $ IntSet.union productsA productsB
  where productsA = pandigitalProducts [1..9] [1000..9999]
        productsB = pandigitalProducts [10..99] [100..999]
        sum' = IntSet.foldl (+) 0
