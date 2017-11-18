{-# OPTIONS_GHC -Wall #-}

module Main (main) where

import Data.Ix

-- | package array
import Data.Array ((!), (//))
import qualified Data.Array as Array

main :: IO ()
main = print answer

type NRoutesMap = Array.Array (Int, Int) Integer

inBounds :: NRoutesMap -> (Int, Int) -> Bool
inBounds = inRange . Array.bounds

paths :: NRoutesMap -> (Int, Int) -> [(Int, Int)]
paths nMap (i, j) = filter (inBounds nMap) [(i + 1, j), (i, j + 1)]

nRoutesAt :: NRoutesMap -> (Int, Int) -> Integer
nRoutesAt nMap point = case paths nMap point of
                         [] | inBounds nMap point -> 1
                         points -> sum $ map (nMap!) points

nRoutesMap :: (Int, Int) -> NRoutesMap
nRoutesMap gridDims = foldr f emptyNMap (Array.indices emptyNMap)
  where emptyNMap = Array.array ((0, 0), gridDims) []
        f point nMap = nMap // [(point, nRoutesAt nMap point)]

answer :: Integer
answer = nRoutesMap (20, 20)!(0, 0)
