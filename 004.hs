{-# OPTIONS_GHC -Wall #-}

module Main (main) where

main :: IO ()
main = print answer

palindrome :: String -> Bool
palindrome = (==) <*> reverse

answer :: Int
answer = maximum [ z
                 | x <- [100..999]
                 , y <- [100..999]
                 , let z = x * y
                         , palindrome $ show z
                 ]
