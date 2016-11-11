module Update exposing (..)

import Messages exposing (Msg(..))
import Models exposing (Model)
import States.Update


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        StatesMsg subMsg ->
            let
                ( updatedStates, cmd ) =
                    States.Update.update subMsg model.stateState
            in
                ( { model | stateState = updatedStates }, Cmd.map StatesMsg cmd )
