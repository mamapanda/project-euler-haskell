{-# OPTIONS_GHC -Wall #-}

module Main (main) where

main :: IO ()
main = answer >>= print

getTriangle :: IO [[Int]]
getTriangle =
  do contents <- readFile "txt/018.txt"
     let triangle = map (map read . words) $ lines contents
     return triangle

maxTotal :: [[Int]] -> Int
maxTotal = head . head . scanr1 f
  where f row1 row2 = zipWith (+) row1 row2'
          where row2' = zipWith max row2 (tail row2)

answer :: IO Int
answer = maxTotal <$> getTriangle
