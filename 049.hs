{-# OPTIONS_GHC -Wall #-}

module Main (main) where

import Control.Monad
import Data.List
import Text.Printf
-- | package array
import qualified Data.Array.ST as Array
import Data.Array.Unboxed ((!))
import qualified Data.Array.Unboxed as Array

main :: IO ()
main = printf "%d%d%d\n" x y z
  where [x, y, z] = answer

digits :: Integral a => a -> [a]
digits = reverse . digits'
  where digits' 0 = []
        digits' x = digit:digits' x'
          where (x', digit) = quotRem x 10

eSieve :: Int -> Array.UArray Int Bool
eSieve bound = Array.runSTUArray $ do
  sieve <- Array.newListArray (0, bound) (False:False:repeat True)
  forM_ [2..bound] $ \i -> do
    prime <- Array.readArray sieve i
    when prime $
      forM_ [(i * 2),(i * 3)..bound] $ \i' ->
      Array.writeArray sieve i' False
  return sieve

allEqual :: Eq a => [a] -> Bool
allEqual (x:y:rest) = x == y && allEqual (y:rest)
allEqual _ = True

sameDigits :: Integral a => [a] -> Bool
sameDigits xs = allEqual $ map (sort . digits) xs

answer :: [Int]
answer = head [ xs
              | x <- [1000..3339]
              , let xs = [x,(x + 3330)..9999]
                      , all (sieve!) xs
                      , sameDigits xs
                      , xs /= otherAnswer
              ]
  where otherAnswer = [1487, 4817, 8147]
        sieve = eSieve 9999
