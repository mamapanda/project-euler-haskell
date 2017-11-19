{-# OPTIONS_GHC -Wall #-}

module Main (main) where

main :: IO ()
main = print answer

fibs :: [Int]
fibs = 1:1:zipWith (+) fibs (tail fibs)

answer :: Int
answer = sum . filter even $ takeWhile (< 4000000) fibs
