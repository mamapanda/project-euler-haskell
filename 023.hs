{-# OPTIONS_GHC -Wall #-}

module Main (main) where

-- | package containers
import qualified Data.IntSet as IntSet

main :: IO ()
main = print answer

divisors :: Integral a => a -> [a]
divisors x = 1:[ n
               | n <- if even x
                      then [2..maxDivisor]
                      else [3,5..maxDivisor]
               , rem x n == 0
               ]
  where maxDivisor = quot x 2

abundant :: Int -> Bool
abundant = (<) <*> sum . divisors

abundants :: Int -> IntSet.IntSet
abundants limit = abundants' [1..limit] IntSet.empty
  where abundants' [] set = set
        abundants' (x:xs) set
          | IntSet.member x set = abundants' xs set
          | abundant x = let xMultiples = [x,(x * 2)..limit]
                             set' = foldr IntSet.insert set xMultiples
                         in abundants' xs set'
          | otherwise = abundants' xs set

nonAbundantSums :: Int -> [Int]
nonAbundantSums limit = filter nonAbundantSum [1..limit]
  where abundants' = abundants limit
        abundants'' = IntSet.toAscList abundants'
        nonAbundantSum x = null [ (a, b)
                                | a <- takeWhile (<= quot x 2) abundants''
                                , let b = x - a
                                        , IntSet.member b abundants'
                                ]

answer :: Int
answer = sum $ nonAbundantSums 28123
