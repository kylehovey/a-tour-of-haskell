{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE ImportQualifiedPost #-}

module Functor where

import Prelude qualified as P
import Prelude (($), (+), (-), (*), (/), IO, print, show, Int, Show, Eq, String)
import Data.Maybe
import Functor
import ADT

x = Just 4
y = Just 8
halfway = (+) <$> x -- Just (+4)
-- We want something like (+) <$> x <$> y
-- But the second <$> isn't given a function
-- on the left-hand side but `Just (+4)`...

class Applicative f where
  (<*>) :: f (a -> b) -> f a -> f b
  pure :: a -> f a

-- Examples:

-- Add two `Maybe Int`s
x = Just 4
y = Just 8
result = (+) <$> x <*> y -- Just 12

-- Find all sums of values from two lists
sums = (+) <$> [1, 2, 3] <*> [4, 5, 6]
        -- ^ [5,6,7,6,7,8,7,8,9]
  -- Note: the structure join behavior for
  -- lists is to take all combinations.
  -- This is the Cartesian Product.

-- Pure is just a way to bring a value or operation into the application
x = Just 4
y = Just 8
knownVersion = (+) <$> x <*> y -- Just 12
pureVersion = pure (+) <*> x <*> y -- Just 12 (notice the lack of <$>)
anotherWay = (+) <$> pure 10 <*> y -- Just 18
