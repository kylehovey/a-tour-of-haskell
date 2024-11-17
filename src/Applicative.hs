{-# LANGUAGE NoImplicitPrelude #-}

module Applicative where

import Prelude ((+), Integer)
import Data.Maybe
import Functor

x = Just 4
y = Just 8

halfway = (+) <$> x -- Just (+4)

class Functor f => Applicative f where
  (<*>) :: f (a -> b) -> f a -> f b
  pure :: a -> f a

-- Examples:

instance Applicative Maybe where
  (Just f) <*> (Just val) = Just (f val)
  _ <*> _ = Nothing

  pure = Just

z = Just 4
w = Just 8
result = (+) <$> x <*> y -- Just 12

instance Applicative [] where
  fs <*> vals = [f val | f <- fs, val <- vals]

  pure val = [val]

-- Find all sums of values from two lists
sums :: [Integer]
sums = (+) <$> [1, 2, 3] <*> [4, 5, 6]
        -- ^ [5,6,7,6,7,8,7,8,9]

u :: Maybe Integer
u = Just 4
v :: Maybe Integer
v = Just 8

knownVersion :: Maybe Integer
knownVersion = (+) <$> u <*> v -- Just 12

pureVersion :: Maybe Integer
pureVersion = pure (+) <*> u <*> v -- Just 12 (notice the lack of <$>)

anotherWay :: Maybe Integer
anotherWay = (+) <$> pure 10 <*> v -- Just 18
