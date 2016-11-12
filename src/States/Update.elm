module States.Update exposing (..)

import States.Commands exposing (fetchLegislator)
import States.Messages exposing (Msg(..))
import States.Models exposing (StateModel)

update : Msg -> StateModel -> ( StateModel, Cmd Msg )
update message model =
    case message of
        SetState newState ->
          let
            newModel = { model | state = newState }
          in
            ( newModel, fetchLegislator newState )

        FetchLegislatorsDone newLegislators ->
          let
            newModel = { model | legislators = newLegislators }
          in
            ( newModel, Cmd.none )

        FetchLegislatorsFail error ->
          let one = Debug.log "error" error
          in ( { model | legislators = [] }, Cmd.none )
