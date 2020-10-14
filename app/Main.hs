module Main where

import Collatz (collatz_conjecture, collatz_conjecture_traced, factorial)
import Control.DeepSeq
import Control.Exception (evaluate)
import Data.Time (diffUTCTime, getCurrentTime)
import System.Random

main :: IO ()
main = do
  n <- randomRIO (0, factorial 9999)
  print n
  evaluate $ rnf n
  start <- getCurrentTime
  let result = collatz_conjecture_traced n
  evaluate $ result
  end <- getCurrentTime
  print $ diffUTCTime end start
  print result
