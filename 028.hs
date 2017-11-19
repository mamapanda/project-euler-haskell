{-# OPTIONS_GHC -Wall #-}

module Main (main) where

main :: IO ()
main = print answer

diagonals :: Int -> [Int]
diagonals nLayers = scanl (+) 1 diagDeltas
  where diagDeltas = concatMap (replicate 4 . (* 2)) [1..nLayers]

answer :: Int
answer = sum $ diagonals 500
