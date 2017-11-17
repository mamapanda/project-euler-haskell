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

answer :: Integer
answer = primes!!10000
