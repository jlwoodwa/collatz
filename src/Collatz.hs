{-# LANGUAGE BangPatterns #-}

module Collatz (factorial, collatz_conjecture, collatz_conjecture_traced) where

factorial :: Int -> Integer
factorial !n
  | n < 1 = 1
  | otherwise = fromIntegral n * factorial (n - 1)

collatz :: Integer -> Integer
collatz !n
  | rem n 2 == 0 = n `quot` 2
  | otherwise = 1 + (3 * n)

collatz_conjecture :: Integer -> Bool
collatz_conjecture !n
  | n == 1 = True
  | otherwise = collatz_conjecture $ collatz n

collatz_conjecture_traced :: Integer -> Integer
collatz_conjecture_traced !n = go n 0
  where
    go :: Integer -> Integer -> Integer
    go !i !cnt
      | i == 1 = cnt
      | otherwise = go (collatz i) $ cnt + 1
