{-# OPTIONS_GHC -Wall #-}

module Main (main) where

import Data.List
import Data.Ord

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

answer :: Integer
answer = fst $ maximum' [ (x, i - j)
                        | i <- [0..(length sums - 1)]
                        , let sums' = [ (sums!!i - sums!!j, j)
                                      | j <- [(i - 1),(i - 2)..0]
                                      , i - j >= 21
                                      ]
                                , (x, j) <- takeWhile ((<= limit) . fst) sums'
                                , prime x
                        ]
  where limit = 1000000
        sums = primeSums limit
        maximum' = maximumBy (comparing snd)
