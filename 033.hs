{-# OPTIONS_GHC -Wall #-}

module Main (main) where

import Data.List

main :: IO ()
main = print answer

data Fraction = Fraction
                { numerator :: Int
                , denominator :: Int
                }
              deriving (Show)

instance Eq Fraction where
  (==) lhs rhs = n == n' && d == d'
    where (Fraction n d) = simplify lhs
          (Fraction n' d') = simplify rhs

mult :: Fraction -> Fraction -> Fraction
mult (Fraction n d) (Fraction n' d') = Fraction (n * n') (d * d')

product' :: [Fraction] -> Fraction
product' = foldl mult (Fraction 1 1)

simplify :: Fraction -> Fraction
simplify (Fraction n d)
  | n == 0 || d == 0 = Fraction (signum n) (signum d)
  | otherwise = Fraction
                { numerator = quot n gcd'
                , denominator = quot d gcd'
                }
  where gcd' = gcd n d

simplified :: Fraction -> Fraction -> Bool
simplified simple frac = simple == frac && numerator simple < numerator frac

digits :: Int -> [Int]
digits = reverse . digits'
  where digits' 0 = []
        digits' x = digit:digits' x'
          where (x', digit) = quotRem x 10

digitsToNum :: [Int] -> Int
digitsToNum = foldl (\acc x -> acc * 10 + x) 0

retardSimplify :: Fraction -> Fraction
retardSimplify (Fraction n d) = Fraction
                                { numerator = digitsToNum nDigits'
                                , denominator = digitsToNum dDigits'
                                }
  where nDigits = digits n
        dDigits = digits d
        nDigits' = nDigits \\ dDigits
        dDigits' = dDigits \\ nDigits

answer :: Int
answer = denominator . simplify $ product' [ frac
                                           | n <- [10..99]
                                           , d <- [(n + 1)..99]
                                           , rem n 10 /= 0
                                           , rem d 10 /= 0
                                           , let frac = Fraction n d
                                                   , p frac
                                           ]
  where p = flip simplified <*> retardSimplify
