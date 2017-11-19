{-# OPTIONS_GHC -Wall #-}

module Main (main) where

import Control.Arrow
import Data.List
import Data.Ord

main :: IO ()
main = print answer

prime :: Int -> Bool
prime x
  | x <= 1 = False
  | otherwise = prime' primes
  where prime' [] = undefined -- primes is an infinite list
        prime' (p:ps) = p * p > x || (rem x p /= 0 && prime' ps)

primes :: [Int]
primes = 2:3:filter prime [5,7..]

abPairs :: Int -> Int -> [(Int, Int)]
abPairs aMax bMax = [ (a, b)
                    | b <- takeWhile (<= bMax) primes
                    , a <- [(-b)..aMax]
                    ]

primeChain :: Int -> Int -> [Int]
primeChain a b = takeWhile prime $ map f [0..]
  where f n = n * n + a * n + b

answer :: Int
answer = a * b
  where abPairs' = abPairs 1000 1000
        primeChainPairs = map (id &&& uncurry primeChain) abPairs'
        ((a, b), _) = maximumBy (comparing $ length . snd) primeChainPairs
