module Models exposing (..)

import States.Models exposing (StateState)


type alias Model =
    { stateState : StateState }


initialModel : Model
initialModel =
    { stateState = { states = []
                  , selectedState = ""
                  }
    }
