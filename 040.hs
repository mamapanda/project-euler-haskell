{-# OPTIONS_GHC -Wall #-}

module Main (main) where

main :: IO ()
main = print answer

digits :: Int -> [Int]
digits = reverse . digits'
  where digits' 0 = []
        digits' x = digit:digits' x'
          where (x', digit) = quotRem x 10

champernowneDigits :: [Int]
champernowneDigits = concatMap digits [1..]

answer :: Int
answer = product $ map (champernowneDigits!!) xs
  where xs = map (subtract 1 . (10 ^)) [(0 :: Int)..6]
