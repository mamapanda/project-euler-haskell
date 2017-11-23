{-# OPTIONS_GHC -Wall #-}

module Main (main) where

import Control.Arrow
import Data.List
import Data.Ord

main :: IO ()
main = print answer

rightTriangle :: (Int, Int, Int) -> Bool
rightTriangle (a, b, hypo) = a * a + b * b == hypo * hypo

intRightTriangles :: Int -> [(Int, Int, Int)]
intRightTriangles perimeter = [ sides
                              | a <- [1..perimeter]
                              , b <- [a..perimeter]
                              , let c = perimeter - b - a
                                    sides = (a, b, c)
                                      , c > 0
                                      , rightTriangle sides
                              ]

answer :: Int
answer = fst . maximumBy cmp $ map (id &&& intRightTriangles) [1..1000]
  where cmp = comparing $ length . snd
