{-# OPTIONS_GHC -Wall #-}

module Main (main) where

main :: IO ()
main = print answer

nDigits :: Integer -> Int
nDigits = length . show

fibs :: [Integer]
fibs = 1:1:zipWith (+) fibs (tail fibs)

answer :: Int
answer = snd . head . dropWhile p $ zip fibs [1..]
  where p = (< 1000) . nDigits . fst
