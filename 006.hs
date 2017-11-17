{-# OPTIONS_GHC -Wall #-}

module Main (main) where

main :: IO ()
main = print answer

answer :: Integer
answer = abs $ sumOfSquares - squareOfSum
  where sumOfSquares = sum $ map (^ (2 :: Int)) [1..100]
        squareOfSum = (^ (2 :: Int)) $ sum [1..100]
