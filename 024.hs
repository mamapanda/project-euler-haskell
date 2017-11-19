{-# OPTIONS_GHC -Wall #-}

module Main (main) where

import Data.List

main :: IO ()
main = putStrLn answer

nthPerm :: Ord a => Int -> [a] -> [a]
nthPerm i = (!!i) . sort . permutations

answer :: String
answer = nthPerm 999999 "0123456789"
