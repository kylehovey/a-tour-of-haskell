{-# LANGUAGE RecordWildCards #-}

module Reader where

newtype Reader a b = Reader { runReader :: a -> b }

instance Functor (Reader a) where
  f `fmap` (Reader ra) = Reader $ f . ra

instance Applicative (Reader a) where
  (Reader ra) <*> (Reader rb) = Reader $ \ctx -> ra ctx (rb ctx)

  pure = Reader . const

instance Monad (Reader a) where
  (Reader rA) >>= f = Reader $ \ctx -> runReader (f (rA ctx)) ctx

ask :: Reader a a
ask = Reader id

data Environment = Environment
  { envDomain :: String
  , envUseSsl :: Bool
  , envNumbers :: [Integer]
  }

serverUrl :: Reader Environment String
serverUrl = do
  Environment {..} <- ask
  
  let s = if envUseSsl then "s" else ""
  
  pure $ "http" <> s <> "://" <> envDomain

homePage :: Reader Environment String
homePage = do
  root <- serverUrl
  pure $ root <> "/home"

evenNumbers :: Reader Environment [Integer]
evenNumbers = do
  Environment {..} <- ask

  pure $ filter even envNumbers

myContext :: Reader Environment (String, String, [Integer])
myContext = do
  root <- serverUrl
  homeUrl <- homePage
  evens <- evenNumbers

  pure (root, homeUrl, evens)

exampleEnv = Environment
  { envDomain = "example.com"
  , envUseSsl = True
  , envNumbers = [1..10]
  }
