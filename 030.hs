{-# OPTIONS_GHC -Wall #-}

module Main (main) where

main :: IO ()
main = print answer

upperBound :: Int
upperBound = upperBound' 1
  where upperBound' n
          | n * 9 ^ (5 :: Int) < x = x
          | otherwise = upperBound' (n + 1)
          where x = read $ replicate n '9'

digit5thPowSum :: Int -> Int
digit5thPowSum 0 = 0
digit5thPowSum x = digit ^ (5 :: Int) + digit5thPowSum x'
  where (x', digit) = quotRem x 10

answer :: Int
answer = sum $ filter p [2..upperBound]
  where p = (==) <*> digit5thPowSum
