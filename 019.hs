{-# OPTIONS_GHC -Wall #-}

module Main (main) where

main :: IO ()
main = print answer

data Days = Monday | Tuesday | Wednesday | Thursday | Friday | Saturday | Sunday
          deriving (Bounded, Eq, Enum, Show)

days :: [Days]
days = cycle [minBound..maxBound]

leapYear :: Int -> Bool
leapYear year = rem year 4 == 0 && (rem year 100 /= 0 || rem year 400 == 0)

monthDays :: Int -> [Int]
monthDays year = [31, feb, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
  where feb = if leapYear year then 29 else 28

monthDays' :: Int -> Int -> [Int]
monthDays' = (concatMap monthDays .) . enumFromTo

answer :: Int
answer = length . filter firstSunday . drop1900 $ zip days days'
  where days' = concatMap (enumFromTo 1) $ monthDays' 1900 2000
        drop1900 = drop (sum $ monthDays 1900)
        firstSunday (day, i) = day == Sunday && i == 1
