{-# LANGUAGE TupleSections #-}

module State where

newtype State s a = State (s -> (a, s))

instance Functor (State s) where
  f `fmap` (State g) = State g'
    where g' s = (f . fst . g $ s, s)

instance Applicative (State s) where
  (State f) <*> (State g) = State h
    where h s = (f' a, s'') 
            where (a, s'') = g s'
                  (f', s') = f s

  pure x = State fx
    where fx s = (x, s)

instance Monad (State s) where
  (State f) >>= g = State res
    where res s = g' s'
            where (State g') = g a
                  (a, s') = f s

runState :: State s a -> s -> (a, s)
runState (State g) = g

evalState :: State s a -> s -> a
evalState state s = fst (runState state s)

execState :: State s a -> s -> s
execState state s = snd (runState state s)

put :: s -> State s ()
put x = State $ const ((), x)

get :: State s s
get = State (\x -> (x, x))

increment :: State Int Int
increment = do
  value <- get
  put $ value + 1
  pure $ value + 1

multiply :: Int -> State Int Int
multiply n = do
  value <- get
  pure $ value * n

example :: State Int (Int, Int)
example = do
  x <- increment
  y <- multiply 5

  pure (x, y)
