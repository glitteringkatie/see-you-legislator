module States.Models exposing (..)

type alias StateModel =
  { state : State
  , representatives : Legislators
  , senators : Legislators
  }

type alias State =
    String

type alias Legislator =
  { firstname : Maybe String
  , lastname : Maybe String
  , link : Maybe String
  , name : Maybe String
  , twitterid : Maybe String
  }

type alias LegislatorContact =
  { office : Maybe String
  , contact_form : Maybe String
  }

type alias LegislatorData =
  { description : Maybe String
  , extra : LegislatorContact
  , party : Maybe String
  , person : Legislator
  , phone : Maybe String
  , role_type : Maybe String
  , website : Maybe String
  }

type alias Legislators =
  List LegislatorData
