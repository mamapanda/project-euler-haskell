{-# OPTIONS_GHC -Wall #-}

module Main (main) where

main :: IO ()
main = print answer

digitSum :: Integral a => a -> a
digitSum 0 = 0
digitSum x = digit + digitSum x'
  where (x', digit) = quotRem x 10

fact :: Integral a => a -> a
fact 0 = 1
fact x = product [1..x]

answer :: Integer
answer = digitSum (fact 100)
