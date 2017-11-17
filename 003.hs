{-# OPTIONS_GHC -Wall #-}

module Main (main) where

main :: IO ()
main = print answer

prime :: Integer -> Bool
prime = prime' primes
  where prime' [] _ = undefined -- primes is an infinite list
        prime' (p:ps) x = p * p > x || (rem x p /= 0 && prime' ps x)

primes :: [Integer]
primes = 2:3:filter prime [5,7..]

largestPrimeFactor :: Integer -> Integer
largestPrimeFactor = lpf primes 0
  where lpf [] _ _ = undefined -- primes is infinite
        lpf (p:ps) largest x
          | p > x = largest
          | remainder == 0 = lpf ps p x'
          | otherwise = lpf ps largest x
          where (x', remainder) = quotRem x p

answer :: Integer
answer = largestPrimeFactor 600851475143
