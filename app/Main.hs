module Main (main) where

import Text.Read (readMaybe)
-- All of these imports are technically unused,
-- but it makes it so that `stack repl` automatically
-- loads them for the demo.
import ADT
import Applicative hiding ((<*>))
import Functor hiding ((<$>))
import Monad
import Pattern
import Typeclass

-- This file is the entry point for the project, but because I
-- set up modules for each section of the talk, I don't really
-- have much going on here.

main :: IO ()
main = do
  putStrLn "Enter a number:"
  mA <- readMaybe <$> getLine
  putStrLn "Enter another number:"
  mB <- readMaybe <$> getLine

  let added :: Maybe Int
      added = (+) <$> mA <*> mB

  case added of
    Just summation -> print $ show summation
    Nothing -> print "Please enter numbers"
