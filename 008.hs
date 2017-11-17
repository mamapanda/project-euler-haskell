{-# OPTIONS_GHC -Wall #-}

module Main (main) where

import Data.List

main :: IO ()
main = answer >>= print

getNumbers :: IO [Integer]
getNumbers =
  do contents <- readFile "txt/008.txt"
     let contents' = concat $ lines contents
     return $ map (read . return) contents'

product13 :: [Integer] -> Integer
product13 = product . take 13

answer' :: [Integer] -> Integer
answer' = maximum . map product13 . tails

answer :: IO Integer
answer = answer' <$> getNumbers
