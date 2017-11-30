{-# OPTIONS_GHC -Wall #-}

module Main (main) where

import Control.Monad

main :: IO ()
main = print answer

lastNDigits :: Integral a => Int -> a -> a
lastNDigits n = flip rem (10 ^ n)

answer :: Integer
answer = lastNDigits 10 . sum $ map (join (^)) [1..1000]
