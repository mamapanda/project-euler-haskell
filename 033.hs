{-# OPTIONS_GHC -Wall #-}

module Main (main) where

main :: IO ()
main = print answer

-- the fraction must fit the form (10n + c)/(10c + d) == n/d
-- to be digit-cancellable
type NDCGroup = (Int, Int, Int)
type Fraction = (Int, Int)

toFraction :: NDCGroup -> Fraction
toFraction (n, d, c) = (10 * n + c, 10 * c + d)

digitCancellable :: NDCGroup -> Bool
digitCancellable (n, d, c) = 9 * n * (d - c) == c * (n - d)

multiply :: Fraction -> Fraction -> Fraction
multiply (n, d) (n', d') = (n * n', d * d')

simplify :: Fraction -> Fraction
simplify (n, d) = (quot n gcd', quot d gcd')
  where gcd' = gcd n d

answer :: Int
answer = snd . simplify $ foldl1 multiply [ toFraction ndcGroup
                                          | n <- [1..9]
                                          , d <- [(n + 1)..9]
                                          , c <- [(d + 1)..9]
                                          , let ndcGroup = (n, d, c)
                                                  , digitCancellable ndcGroup
                                          ]
