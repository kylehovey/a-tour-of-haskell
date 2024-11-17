{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE ImportQualifiedPost #-}

module Functor where

import Prelude qualified as P
import Prelude (($), (+), (-), (*), (/), IO, print, show, Int, Show, Eq, String)

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
chained = (+4) <$> (*2)
result = chained 7 -- 7*2 + 4 = 18
