{-# OPTIONS_GHC -Wall #-}

module Main (main) where

import Text.Printf

main :: IO ()
main = print answer

palindrome :: String -> Bool
palindrome = (==) <*> reverse

toBinary :: Int -> String
toBinary = printf "%b"

dualBasePalindrome :: Int -> Bool
dualBasePalindrome x = palindrome (show x) && palindrome (toBinary x)

answer :: Int
answer = sum $ filter dualBasePalindrome [1..999999]
