{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE ImportQualifiedPost #-}

module Monad where

import Prelude qualified as P
import Prelude (($), (+), (-), (*), (/), IO, print, show, Int, Show, Eq, String)
import Data.Maybe
import Functor
import Applicative
import ADT

-- Assume these came from elsewhere, input, DB, etc...
address = Just "123 P. Sherman Lane"
password = Just "hunter3"
missingName = Nothing
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
badUser = User <$> address <*> password <*> missingName
        -- ^ Nothing
myUser = User <$> address <*> password <*> presentName
        -- ^ Just (User {..})

-- But what if we want to condition on the password? We want
-- to hypothetically return `Nothing` if the password is
-- too short (<9001 characters).
validUserName :: User -> Maybe User
validUserName user
  | length (userPassword user) < 9001 = Nothing
  | otherwise = Just user

-- We can run this easily enough
validated = validUser myUser

-- But what if we also want to validate address length?
validUserAddress :: User -> Maybe User
validUserAddress user
  | length (userAddress user) < 9001 = Nothing
  | otherwise = Just user

-- We can't run this anymore... Our validation expects
-- a `User` not a `Maybe User`. How do we chain these?
-- validUserAddress (validateUserAddress myUser)
--	^^^^^^^^^^^^^^^^^^^^^^^^^^^^ This is `Maybe User`

-- The Monad!!
instance Monad f where
  (=<<) :: (a -> f b) -> f a -> f b

-- Parentheses not needed, but added for clarity
validUser = validUserAddress =<< (validUserName myUser)

userValue = Just 4

lambdaVersion = (\x -> Just (x * 3))
  =<< (\x -> if even x then Just x else Nothing)
  =<< userValue
  -- Just 12

doVersion = do
  x <- userValue
  y <- if even x then Just x else Nothing
  Just (y * 3)
  -- Just 12

genericVersion = do
  x <- userValue
  y <- if even x then pure x else mempty
  pure (y * 3)
  -- Just 12

userValues = [1, 2, 3, 4, 5]

processed = do
  x <- userValues
  y <- if even x then pure x else mempty
  pure (y * 3)
  -- [6, 12]

-- How do we do IO? (see Main)
