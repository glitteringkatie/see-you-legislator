module States.Models exposing (..)


type alias StateName =
    String


type alias State =
    { name : StateName
    , abbreviation : String
    }

type alias StateState =
  { states : List State
  , selectedState: String
  }

