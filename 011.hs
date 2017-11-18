{-# OPTIONS_GHC -Wall #-}

module Main (main) where

main :: IO ()
main = answer >>= print

horiIndices :: [[(Int, Int)]]
horiIndices = [ [ (i, j')
                | j' <- [j..(j + 3)]
                ]
              | i <- [0..19]
              , j <- [0..16]
              ]

swapPair :: (a, b) -> (b, a)
swapPair (x, y) = (y, x)

vertIndices :: [[(Int, Int)]]
vertIndices = map (map swapPair) horiIndices

diagIndices :: [[(Int, Int)]]
diagIndices = [ zip [i..(i + 3)] [j..(j + 3)]
              | i <- [0..16]
              , j <- [0..16]
              ]

diagIndices' :: [[(Int, Int)]]
diagIndices' = [ zip [i..(i + 3)] [j,(j - 1)..(j - 3)]
               | i <- [0..16]
               , j <- [3..19]
               ]

indexGroups :: [[(Int, Int)]]
indexGroups = horiIndices ++ vertIndices ++ diagIndices ++ diagIndices'

productAt :: [(Int, Int)] -> [[Int]] -> Int
productAt indices grid = product [ (grid!!i)!!j
                                 | (i, j) <- indices
                                 ]

getGrid :: IO [[Int]]
getGrid =
  do contents <- readFile "txt/011.txt"
     let grid = map words $ lines contents
     return $ map (map read) grid

answer' :: [[Int]] -> Int
answer' grid = maximum [ productAt indices grid
                       | indices <- indexGroups
                       ]

answer :: IO Int
answer = answer' <$> getGrid
