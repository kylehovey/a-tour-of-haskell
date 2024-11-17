{-# LANGUAGE NoImplicitPrelude #-}

module Monad where

import Prelude (otherwise, length, even, (++), (<), (*), Int, Show, String)
import Data.Maybe
import Functor
import Applicative

-- Assume these came from elsewhere, input, DB, etc...
myAddress :: Maybe String
myAddress = Just "123 P. Sherman Lane"

myPassword :: Maybe String
myPassword = Just "hunter3"

missingName :: Maybe String
missingName = Nothing

presentName :: Maybe String
presentName = Just "Leeroy Jenkins"

-- All these values are required
data User = User
  { userAddress :: String
  , userPassword :: String
  , userName :: String
  }
  deriving Show

-- This is a use of functor/applicative to construct a user
-- from optionally present values.
badUser :: Maybe User
badUser = User <$> myAddress <*> myPassword <*> missingName
        -- ^ Nothing
myUser :: Maybe User
myUser = User <$> myAddress <*> myPassword <*> presentName
        -- ^ Just (User {..})

-- But what if we want to condition on the password? We want
-- to hypothetically return `Nothing` if the password is
-- too short (<9001 characters).
validUserName :: User -> Maybe User
validUserName user
  | length (userPassword user) < 9001 = Nothing
  | otherwise = Just user

-- We can run this easily enough
presentUser :: User
presentUser = User "A st" "hunter3" "Atrus"

validated :: Maybe User
validated = validUserName presentUser

-- But what if we also want to validate address length?
validUserAddress :: User -> Maybe User
validUserAddress user
  | length (userAddress user) < 9001 = Nothing
  | otherwise = Just user

-- We can't run this anymore... Our validation expects
-- a `User` not a `Maybe User`. How do we chain these?
-- validUserAddress (validateUserAddress presentUser)
--	^^^^^^^^^^^^^^^^^^^^^^^^^^^^ This is `Maybe User`

-- The Monad!!
class Monad f where
  (=<<) :: (a -> f b) -> f a -> f b

instance Monad Maybe where
  f =<< Just val = f val
  _ =<< _ = Nothing

-- Parentheses not needed, but added for clarity
validUser :: Maybe User
validUser = validUserAddress =<< validUserName presentUser

userValue :: Maybe Int
userValue = Just 4

lambdaVersion :: Maybe Int
lambdaVersion =
  (\val -> Just (val * 3)) =<< (
    (\val -> if even val then Just val else Nothing) =<< userValue
  )
  -- Just 12

doVersion :: Maybe Int
doVersion = do
  input <- userValue
  evenValue <- if even input then Just input else Nothing
  Just (evenValue * 3)
  -- Just 12

class Monoid f where
  (<>) :: f a -> f a -> f a
  mempty :: f a

instance Monoid [] where
  (<>) = (++)

  mempty = []

instance Monoid Maybe where
  _ <> Just right = Just right
  _ <> _ = Nothing
  
  mempty = Nothing

genericVersion :: Maybe Int
genericVersion = do
  input <- userValue
  evenValue <- if even input then pure input else mempty
  pure (evenValue * 3)
  -- Just 12

userValues :: [Int]
userValues = [1, 2, 3, 4, 5]

processed :: [Int]
processed = do
  input <- userValues
  evenValue <- if even input then pure input else mempty
  pure (evenValue * 3)
  -- [6, 12]

-- How do we do IO? (see Main)
