module Main (main) where

import Text.Read (readMaybe)

-- This file is the entry point for the project, but because I
-- set up modules for each section of the talk, I don't really
-- have much going on here.

main :: IO ()
main = do
  putStrLn "Enter a number:"
  mA <- readMaybe <$> getLine
  putStrLn "Enter another number:"
  mB <- readMaybe <$> getLine

  let result :: Maybe Int
      result = (+) <$> mA <*> mB

  case result of
    Just summation -> print $ show summation
    Nothing -> print "Please enter numbers"
