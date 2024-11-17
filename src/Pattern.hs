module Pattern where

-- You can match on values for functions. `0` and `1`
-- as arguments will match before the more general pattern
-- listed last.
fib :: Int -> Int
fib 0 = 1
fib 1 = 1
fib n = fib (n - 1) + fib (n - 2)

-- Alternatively, you can case match
fib' :: Int -> Int
fib' n = case n of
  1 -> 1
  2 -> 1
  _ -> fib (n - 1) + fib (n - 2)

-- This extends to data constructors as well
data ListIndex = ZeroBased Int | OneBased Int

toZeroBased :: ListIndex -> Int
toZeroBased listIndex = case listIndex of
  -- On the left-hand side, x is bound to the contained value
  ZeroBased x -> x
  OneBased x -> x - 1

safeIndex :: ListIndex -> [a] -> Maybe a
safeIndex _ [] = Nothing
safeIndex index (x:xs)
  | toZeroBased index < 0 = Nothing
  | otherwise = case index of
      OneBased 1 -> Just x
      ZeroBased 0 -> Just x
      OneBased i -> safeIndex (OneBased (i - 1)) xs
      ZeroBased i -> safeIndex (ZeroBased (i - 1)) xs
