{-# OPTIONS_GHC -Wall #-}

module Main (main) where

import Data.List
import Text.Printf

main :: IO ()
main = print answer

digits :: Integer -> [Integer]
digits = reverse . digits'
  where digits' 0 = []
        digits' x = digit:digits' x'
          where (x', digit) = quotRem x 10

pandigital :: Integer -> Bool
pandigital = (== [0..9]) . sort . digits

multiples :: Integer -> [Integer]
multiples x = map (x *) [1..]

subDivisibleNumbers :: [Integer] -> [Integer]
subDivisibleNumbers divisors = map read $ f (reverse divisors) []
  where f [] suffix = map (:suffix) ['1'..'9']
        f (x:xs) suffix = [ prefix ++ drop 2 multiple'
                          | multiple <- takeWhile (<= 999) $ multiples x
                          , let multiple' = printf "%.3d" multiple
                                  , suffix `isSuffixOf` multiple'
                                  , prefix <- f xs (take 2 multiple')
                          ]

subDivisiblePandigitals :: [Integer] -> [Integer]
subDivisiblePandigitals = filter pandigital . subDivisibleNumbers

answer :: Integer
answer = sum $ subDivisiblePandigitals [2, 3, 5, 7, 11, 13, 17]
