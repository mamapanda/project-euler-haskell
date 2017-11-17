{-# OPTIONS_GHC -Wall #-}

module Main (main) where

main :: IO ()
main = print answer

answer :: Integer
answer = foldl1 lcm [1..20]
