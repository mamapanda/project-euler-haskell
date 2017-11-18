{-# OPTIONS_GHC -Wall #-}

module Main (main) where

-- | package containers
import qualified Data.Map.Lazy as Map

main :: IO ()
main = print answer

collatz :: Integer -> Integer
collatz x
  | even x = quot x 2
  | otherwise = 3 * x + 1

nCollatz :: Map.Map Integer Int -> Integer -> (Int, Map.Map Integer Int)
nCollatz lenMap x
  | x == 1 = (1, lenMap)
  | otherwise = case Map.lookup x lenMap of
                  Just len -> (len, lenMap)
                  Nothing -> let (len, lenMap') = nCollatz lenMap (collatz x)
                                 len' = len + 1
                             in (len', Map.insert x len' lenMap')

maxCollatz :: Integer -> (Integer, Int)
maxCollatz xMax = fst $ foldl f ((1, 1), Map.singleton 1 1) [2..xMax]
  where f (best@(_, maxLen), lenMap) x
          | collatzLen > maxLen = ((x, collatzLen), lenMap')
          | otherwise = (best, lenMap')
          where (collatzLen, lenMap') = nCollatz lenMap x

answer :: Integer
answer = fst $ maxCollatz 1000000
