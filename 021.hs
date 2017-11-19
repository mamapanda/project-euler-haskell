{-# OPTIONS_GHC -Wall #-}

module Main (main) where

main :: IO ()
main = print answer

divisors :: Int -> [Int]
divisors x = 1:[ n
               | n <- if even x
                      then [2..maxDivisor]
                      else [3,5..maxDivisor]
               , rem x n == 0
               ]
  where maxDivisor = quot x 2

sumDivisors :: Int -> Int
sumDivisors = sum . divisors

amicable :: Int -> Bool
amicable x = x /= d && x == sumDivisors d
  where d = sumDivisors x

answer :: Int
answer = sum $ filter amicable [1..10000]
