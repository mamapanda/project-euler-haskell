{-# OPTIONS_GHC -Wall #-}

module Main (main) where

-- | package vector
import Data.Vector ((!))
import qualified Data.Vector as Vector

main :: IO ()
main = print answer

prime :: Integer -> Bool
prime = prime' primes
  where prime' [] _ = undefined
        prime' (p:ps) x = p * p > x || (rem x p /= 0 && prime' ps x)

primes :: [Integer]
primes = 2:3:filter prime [5,7..]

primeSums :: Integer -> [Integer]
primeSums limit = scanl1 (+) $ takeWhile (<= limit) primes

longestPrimeSum :: Integer -> Integer
longestPrimeSum sumLimit = f (2, 1) 0 0
  where sums = Vector.fromList $ primeSums sumLimit
        f best@(primeSum, nPrimes) i j
          | i == length sums = primeSum
          | j < 0 || currentSum > sumLimit = f best (i + 1) i
          | nPrimes' > nPrimes && prime currentSum = f current i (j - 1)
          | otherwise = f best i (j - 1)
          where current@(currentSum, nPrimes') = (sums!i - sums!j, i - j)

answer :: Integer
answer = longestPrimeSum 999999
