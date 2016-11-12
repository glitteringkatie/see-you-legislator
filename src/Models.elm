module Models exposing (..)

import States.Models exposing (StateModel)


type alias Model =
    { stateModel : StateModel
    }


initialModel : Model
initialModel =
    { stateModel = { state = "", legislators = [] } }
