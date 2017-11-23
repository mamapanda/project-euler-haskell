{-# OPTIONS_GHC -Wall #-}

module Main (main) where

import Data.List
import Data.Maybe

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

copandigitalMultiples :: Int -> Maybe [Int]
copandigitalMultiples x = f [] 1
  where f multiples n
          | totalDigits > 9 = Nothing
          | totalDigits == 9 = if copandigital multiples
                               then Just $ reverse multiples
                               else Nothing
          | otherwise = f (n * x:multiples) (n + 1)
          where totalDigits = sum $ map nDigits multiples

answer :: Int
answer = maximum $ mapMaybe f [1..9876]
  where f = fmap (foldl1 connect) . copandigitalMultiples
