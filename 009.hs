{-# OPTIONS_GHC -Wall #-}

module Main (main) where

main :: IO ()
main = print answer

pyTriplet :: Int -> Int -> Int -> [(Int, Int, Int)]
pyTriplet aMax bMax cMax = [ (a, b, c)
                           | a <- [1..aMax]
                           , b <- [(a + 1)..bMax]
                           , c <- [(b + 1)..cMax]
                           , a * a + b * b == c * c
                           ]

tripSum :: (Int, Int, Int) -> Int
tripSum (a, b, c) = a + b + c

answer :: Int
answer = case filter p triplets of
           [(a, b, c)] -> a * b * c
           _ -> undefined -- there is only one solution
  where triplets = pyTriplet 1000 1000 1000
        p = (== 1000) . tripSum
