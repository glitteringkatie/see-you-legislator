module Update exposing (..)

import Messages exposing (Msg(..))
import Models exposing (Model)
import States.Update


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        StatesMsg subMsg ->
            let
                ( updatedState, cmd ) =
                    States.Update.update subMsg model.stateModel
            in
                ( { model | stateModel = updatedState }, Cmd.map StatesMsg cmd )
