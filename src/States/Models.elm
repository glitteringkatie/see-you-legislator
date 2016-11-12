module States.Models exposing (..)

type alias StateModel =
  { state : State
  , legislators : Legislators
  }

type alias State =
    String

type alias Legislator =
  { firstname : String
  , lastname : String
  , link : String
  , name : String
  , twitterid : Maybe String
  , youtubeid : Maybe String
  }

type alias LegislatorContact =
  { office : String
  , contact_form : Maybe String
  }

type alias LegislatorData =
  { description : String
  , extra : LegislatorContact
  , party : String
  , person : Legislator
  , phone : String
  , role_type : String
  , website : String
  }

type alias Legislators =
  List LegislatorData
