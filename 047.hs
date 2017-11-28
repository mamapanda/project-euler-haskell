{-# OPTIONS_GHC -Wall #-}

module Main (main) where

import Data.List

main :: IO ()
main = print answer

prime :: Int -> Bool
prime = prime' primes
  where prime' [] _ = undefined
        prime' (p:ps) x = p * p > x || (rem x p /= 0 && prime' ps x)

primes :: [Int]
primes = 2:3:filter prime [5,7..]

primeFactors :: Int -> [Int]
primeFactors = primeFactors' primes []
  where primeFactors' [] _ _ = undefined
        primeFactors' ps@(p:rest) factors x
          | x == 1 = reverse factors
          | remainder == 0 = primeFactors' ps (p:factors) x'
          | otherwise = primeFactors' rest factors x
          where (x', remainder) = quotRem x p

nDistinctPrimeFactors :: Int -> Int
nDistinctPrimeFactors = length . group . primeFactors

answer :: Int
answer = head $ answer' (product (take 4 primes)) []
  where answer' n xs
          | length xs == 4 = reverse xs
          | nDistinctPrimeFactors n == 4 = answer' (n + 1) (n:xs)
          | otherwise = answer' (n + 1) []
