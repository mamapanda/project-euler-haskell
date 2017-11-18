{-# OPTIONS_GHC -Wall #-}

module Main (main) where

import Data.List

main :: IO ()
main = print answer

prime :: Integer -> Bool
prime = prime' primes
  where prime' [] _ = undefined -- primes is an infinite list
        prime' (p:ps) x = p * p > x || (rem x p /= 0 && prime' ps x)

primes :: [Integer]
primes = 2:3:filter prime [5,7..]

primeFactors :: Integer -> [Integer]
primeFactors = primeFactors' primes []
  where primeFactors' [] _ _ = undefined
        primeFactors' ps@(p:rest) factors x
          | x == 1 = reverse factors
          | remainder == 0 = primeFactors' ps (p:factors) x'
          | otherwise = primeFactors' rest factors x
          where (x', remainder) = quotRem x p

nFactors :: Integer -> Int
nFactors = product . map (succ . length) . group . primeFactors

triangles :: [Integer]
triangles = [ sum [1..x]
            | x <- [1..]
            ]

answer :: Integer
answer = head $ dropWhile ((<= 500) . nFactors) triangles
