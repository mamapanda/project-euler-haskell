{-# OPTIONS_GHC -Wall #-}

module Main (main) where

main :: IO ()
main = print answer

sqrtFloor :: Integer -> Integer
sqrtFloor = (floor :: Double -> Integer) . sqrt . fromIntegral

perfectSquare :: Integer -> Bool
perfectSquare x = sqrtFloor x ^ (2 :: Int) == x

pentagon :: Integer -> Bool
pentagon x = perfectSquare n && rem (sqrtFloor n) 6 == 5
  where n = 24 * x + 1

hexagons :: [Integer]
hexagons = map f [1..]
  where f n = n * (2 * n - 1)

answer :: Integer
answer = head [ x
              | x <- dropWhile (<= 40755) hexagons
              , pentagon x
              ]
