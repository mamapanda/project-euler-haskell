{-# OPTIONS_GHC -Wall #-}

module Main (main) where

import Data.Ix
-- | package containers
import qualified Data.Set as Set

main :: IO ()
main = print answer

powers :: (Int, Int) -> (Int, Int) -> Set.Set Integer
powers baseRange expRange = Set.fromList [ fromIntegral a ^ b
                                         | a <- range baseRange
                                         , b <- range expRange
                                         ]

answer :: Int
answer = Set.size $ powers (2, 100) (2, 100)
