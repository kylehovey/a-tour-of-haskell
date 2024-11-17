{-# LANGUAGE NoImplicitPrelude #-}

module Functor where

import Prelude ((.), (==), (*), ($), (+), Integer, Num, Bool, Eq)
import Data.Maybe

timesTwo x = 2 * x

-- ghci> :t ($)
-- ($) :: (a -> b) -> a -> b
-- ^ Take a function `f` and apply it to an argument

aResult = timesTwo $ 5

theSame = timesTwo 5

-- Instances get to decide what this means for the given
-- type.
class Functor f where
  (<$>) :: (a -> b) -> f a -> f b

instance Functor Maybe where
  f <$> (Just x) = Just (f x)
  _ <$> Nothing = Nothing

instance Functor [] where
  _ <$> [] = []
  f <$> (x:xs) = f x : f <$> xs

-- Examples:

-- Apply a function over a list.
threeAdded = (+3) <$> [1, 2, 3] -- [4, 5, 6]

-- Compare with a value that may or may not be present
found = Just 3
missing = Nothing
check x = x == 3

a = check <$> found -- Just True
b = check <$> missing -- Nothing

-- Chain two functions together:
-- The payload here is an operation, not a value.
-- "Add four after multiplying by two"
instance Functor ((->) a) where
  f <$> g = f . g

chained = (+4) <$> (*2)

result = chained 7 -- 7*2 + 4 = 18
