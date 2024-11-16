module ListIndex where

data ListIndex
  = OneBased Int
  | ZeroBased Int

toZeroBased :: ListIndex -> Int
toZeroBased (OneBased x) = x - 1
toZeroBased (ZeroBased x) = x

safeIndex :: ListIndex -> [a] -> Maybe a
safeIndex _ [] = Nothing
safeIndex index (x:xs)
  | toZeroBased index < 0 = Nothing
  | otherwise = case index of
      OneBased 1 -> Just x
      ZeroBased 0 -> Just x
      OneBased i -> safeIndex (OneBased (i - 1)) xs
      ZeroBased i -> safeIndex (ZeroBased (i - 1)) xs
