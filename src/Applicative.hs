{-# LANGUAGE NoImplicitPrelude #-}

module Applicative where

import Prelude ((+), Int)
import Data.Maybe
import Functor

x :: Maybe Int
x = Just 4

y :: Maybe Int
y = Just 8

halfway :: Maybe (Int -> Int)
halfway = (+) <$> x -- Just (+4)
-- We want something like (+) <$> x <$> y
-- But the second <$> isn't given a function
-- on the left-hand side but `Just (+4)`...

class Functor f => Applicative f where
  (<*>) :: f (a -> b) -> f a -> f b
  pure :: a -> f a

-- Examples:

instance Applicative Maybe where
  (Just f) <*> (Just val) = Just (f val)
  _ <*> _ = Nothing

  pure = Just

-- Add two `Maybe Int`s
z :: Maybe Int
z = Just 4

w :: Maybe Int
w = Just 8

result :: Maybe Int
result = (+) <$> x <*> y -- Just 12

instance Applicative [] where
  fs <*> vals = [f val | f <- fs, val <- vals]
  -- Note: the structure join behavior for
  -- lists is to take all combinations.
  -- This is the Cartesian Product.

  pure val = [val]

-- Find all sums of values from two lists
sums :: [Int]
sums = (+) <$> [1, 2, 3] <*> [4, 5, 6]
        -- ^ [5,6,7,6,7,8,7,8,9]

-- Pure is just a way to bring a value or operation into the application
u :: Maybe Int
u = Just 4

v :: Maybe Int
v = Just 8

knownVersion :: Maybe Int
knownVersion = (+) <$> u <*> v -- Just 12

pureVersion :: Maybe Int
pureVersion = pure (+) <*> u <*> v -- Just 12 (notice the lack of <$>)

anotherWay :: Maybe Int
anotherWay = (+) <$> pure 10 <*> v -- Just 18
