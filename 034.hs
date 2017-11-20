{-# OPTIONS_GHC -Wall #-}

module Main (main) where

main :: IO ()
main = print answer

digits :: Int -> [Int]
digits = reverse . digits'
  where digits' 0 = []
        digits' x = digit:digits' x'
          where (x', digit) = quotRem x 10

fact :: Integral a => a -> a
fact 0 = 1
fact x = product [1..x]

upperBound :: Int
upperBound = upperBound' 2
  where upperBound' nNines
          | bound > nNines * fact 9 = bound
          | otherwise = upperBound' (nNines + 1)
          where bound = read $ replicate nNines '9'

answer :: Int
answer = sum $ filter p [10..upperBound]
  where p = (==) <*> sum . map fact . digits
