module Typeclass where

-- class Num a where
--   (+), (-), (*)       :: a -> a -> a
--   negate              :: a -> a
--   abs                 :: a -> a
--   signum              :: a -> a
--   fromInteger         :: Integer -> a
--   x - y               = x + negate y
--   negate x            = 0 - x

class Summable s where
  getSum :: Num a => s a -> a
  -- ^ A higher kinded type

instance Summable [] where
  getSum = sum

instance Summable Maybe where
  getSum (Just x) = x
  getSum Nothing = 0

fooSum = getSum [1, 2, 3, 4, 5]

barSum = getSum (Just 4)
