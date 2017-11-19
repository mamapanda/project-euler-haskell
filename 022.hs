{-# OPTIONS_GHC -Wall #-}

module Main (main) where

import Data.Char
import Data.List

main :: IO ()
main = answer >>= print

getNames :: IO [String]
getNames = read . ('[':) . (++ "]") <$> readFile "txt/022.txt"

charScore :: Char -> Int
charScore c = ord c - ord 'A' + 1

nameScore :: String -> Int -> Int
nameScore = (*) . sum . map charScore

nameScores :: [String] -> Int
nameScores = sum . flip (zipWith nameScore) [1..] . sort

answer :: IO Int
answer = nameScores <$> getNames
