{-# OPTIONS_GHC -Wall #-}

module Main (main) where

import Data.Char

main :: IO ()
main = answer >>= print

triangles :: [Int]
triangles = map f [1..]
  where f n = quot (n * (n + 1)) 2

triangle :: Int -> Bool
triangle x = triangle' triangles
  where triangle' [] = undefined
        triangle' (t:ts)
          | x < t = False
          | x == t = True
          | otherwise = triangle' ts

getWords :: IO [String]
getWords = read . ('[':) . (++ "]") <$> readFile "txt/042.txt"

charValue :: Char -> Int
charValue c = ord c - ord 'A' + 1

wordValue :: String -> Int
wordValue = sum . map charValue

answer :: IO Int
answer = length . filter triangle . map wordValue <$> getWords
