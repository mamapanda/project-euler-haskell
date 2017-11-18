{-# OPTIONS_GHC -Wall #-}

module Main (main) where

import Text.Printf

main :: IO ()
main = print answer

toWords :: Int -> String
toWords 0 = ""
toWords 1 = "one"
toWords 2 = "two"
toWords 3 = "three"
toWords 4 = "four"
toWords 5 = "five"
toWords 6 = "six"
toWords 7 = "seven"
toWords 8 = "eight"
toWords 9 = "nine"
toWords 10 = "ten"
toWords 11 = "eleven"
toWords 12 = "twelve"
toWords 13 = "thirteen"
toWords 14 = "fourteen"
toWords 15 = "fifteen"
toWords 16 = "sixteen"
toWords 17 = "seventeen"
toWords 18 = "eighteen"
toWords 19 = "nineteen"
toWords 20 = "twenty"
toWords 30 = "thirty"
toWords 40 = "forty"
toWords 50 = "fifty"
toWords 60 = "sixty"
toWords 70 = "seventy"
toWords 80 = "eighty"
toWords 90 = "ninety"
toWords 1000 = "one thousand"
toWords x
  | x > 1000 || x < 0 = undefined
  | hundreds /= 0 && tens == 0 && ones == 0 = printf "%s hundred" hundreds'
  | hundreds /= 0 = printf "%s hundred and %s" hundreds' (toWords lastTwo)
  | otherwise = printf "%s %s" (toWords $ tens * 10) (toWords ones)
  where [hundreds, tens, ones] = map (read . return) (printf "%.3d" x)
        lastTwo = tens * 10 + ones
        hundreds' = toWords hundreds

answer :: Int
answer = sum $ map (length . filter (/= ' ') . toWords) [1..1000]
