module ADT where

-- Sum types:

data NotificationPreference
  = DoNotNotify
  | NotifyIntervalDays Int
  | NotifyIntervalMonths Int
  -- ^ This is Haskell style formatting for multi-line
  --   syntax. Separator first, then value.
  deriving Show
  -- ^ This allows us to print this type

annoyingNotifications = NotifyIntervalDays 1

data UserInput a
  = FromKeyboard a
  | FromTextToSpeech a
  | FromSiameseTwins a a
  | FromMindControl a
  deriving Show

-- `a` is saturated with `Int`, producing `UserInput Int`
userValue = FromKeyboard 5

-- Product types:

type UserNameAndAge = (String, Int)
        -- ("Leeroy Jenkins", 29)
        --    ^ a "product" of `String` and `Int`

type Color = (Int, Int, Int) -- e.g. (255, 0, 255) for purple

-- Record types:

data Address = Address
 { addressNumber :: String
 , addressStreet :: String
 , addressCity :: String
 , addressZipCode :: Int
 }
 deriving Show

myAddress = Address
    { addressNumber = "42"
    , addressStreet = "Wallaby Way"
    , addressCity = "Sydney"
    , addressZipCode = 12345
    }

-- Extracting a value from a record
-- (See :t city)
myCity = addressCity myAddress

-- Constructing record as a function
anotherWay = Address "42" "Wallaby Way" "Sydney" 12345
