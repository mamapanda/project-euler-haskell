{-# OPTIONS_GHC -Wall #-}

module Main (main) where

main :: IO ()
main = print answer

sqrtFloor :: Integer -> Integer
sqrtFloor = (floor :: Double -> Integer) . sqrt . fromIntegral

perfectSquare :: Integer -> Bool
perfectSquare x = sqrtFloor x ^ (2 :: Int) == x

prime :: Integer -> Bool
prime = prime' primes
  where prime' [] _ = undefined -- primes is an infinite list
        prime' (p:ps) x = p * p > x || (rem x p /= 0 && prime' ps x)

primes :: [Integer]
primes = 2:3:filter prime [5,7..]

composites :: [Integer]
composites = filter (not . prime) [3..]

goldbach :: Integer -> Bool
goldbach x = not $ null [ (n, squarePart)
                        | n <- takeWhile (< x) primes
                        , let difference = x - n
                              squarePart = quot difference 2
                                , even difference
                                , perfectSquare squarePart
                        ]

answer :: Integer
answer = head [ x
              | x <- composites
              , odd x && not (goldbach x)
              ]
