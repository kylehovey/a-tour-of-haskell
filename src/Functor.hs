{-# LANGUAGE NoImplicitPrelude #-}

module Functor where

import Prelude ((.), (==), (*), ($), (+), Int, Num, Bool)
import Data.Maybe

timesTwo :: Num a => a -> a
timesTwo x = 2 * x

-- ghci> :t ($)
-- ($) :: (a -> b) -> a -> b
-- ^ Take a function `f` and apply it to an argument

aResult :: Int
aResult = timesTwo $ 5

theSame :: Int
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
threeAdded :: [Int]
threeAdded = (+3) <$> [1, 2, 3] -- [4, 5, 6]

-- Compare with a value that may or may not be present
found :: Maybe Int
found = Just 3

missing :: Maybe Int
missing = Nothing

check :: Int -> Bool
check x = x == 3

a:: Maybe Bool
a = check <$> found -- Just True

b :: Maybe Bool
b = check <$> missing -- Nothing

-- Chain two functions together:
-- The payload here is an operation, not a value.
-- "Add four after multiplying by two"
instance Functor ((->) a) where
  f <$> g = f . g

chained :: Int -> Int
chained = (+4) <$> (*2)

result :: Int
result = chained 7 -- 7*2 + 4 = 18
