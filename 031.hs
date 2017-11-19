{-# OPTIONS_GHC -Wall #-}

module Main (main) where

main :: IO ()
main = print answer

coins :: [Int]
coins = [200, 100, 50, 20, 10, 5, 2, 1]

ways :: Int -> [Int] -> Int
ways 0 _ = 1
ways _ [1] = 1
ways amount (coin:coinSizes) = sum [ ways (amount - n) coinSizes
                                   | n <- [0,coin..amount]
                                   ]
ways _ [] = undefined

answer :: Int
answer = ways 200 coins
