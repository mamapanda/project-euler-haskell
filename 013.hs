{-# OPTIONS_GHC -Wall #-}

module Main (main) where

main :: IO ()
main = answer >>= print

getNumbers :: IO [Integer]
getNumbers = map read . lines <$> readFile "txt/013.txt"

firstNDigits :: Int -> Integer -> Integer
firstNDigits n = read . take n . show

answer :: IO Integer
answer = firstNDigits 10 . sum <$> getNumbers
