module Main where

import Lib
import System.Environment(getArgs)

main :: IO ()
main = do
  args <- getArgs
  case args of
    (filename:_) -> do
      contents <- readFile filename
      let threes = groupsOf 3 (map read $ lines contents)
          roadSystem = map (\[a,b,c] -> Section a b c) threes
          path = optimalPath roadSystem
          pathString = concat $ map (show . fst) path
          pathPrice = sum $ map snd path
      putStrLn $ "The best path to take is: " ++ pathString
      putStrLn $ "The price is: " ++ show pathPrice
