{-# OPTIONS_GHC -Wall #-}

module Main (main) where

main :: IO ()
main = print answer

digitSum :: Integral a => a -> a
digitSum 0 = 0
digitSum x = digit + digitSum x'
  where (x', digit) = quotRem x 10

answer :: Integer
answer = digitSum (2 ^ (1000 :: Int))
