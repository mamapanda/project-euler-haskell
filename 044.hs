{-# OPTIONS_GHC -Wall #-}

module Main (main) where

main :: IO ()
main = print answer

sqrtFloor :: Integer -> Integer
sqrtFloor = (floor :: Double -> Integer) . sqrt . fromIntegral

perfectSquare :: Integer -> Bool
perfectSquare x = rootFloor * rootFloor == x
  where rootFloor = sqrtFloor x

pentagons :: [Integer]
pentagons = map f [1..]
  where f n = quot (n * (3 * n - 1)) 2

pentagon :: Integer -> Bool
pentagon x = perfectSquare n && rem (sqrtFloor n) 6 == 5
  where n = 24 * x + 1

answer :: Integer
answer = y - x
  where (x, y) = head [ (pj, pk)
                      | pk <- pentagons
                      , pj <- reverse $ takeWhile (< pk) pentagons
                      , pentagon (pk + pj) && pentagon (pk - pj)
                      ]
