module States.Update exposing (..)

import States.Messages exposing (Msg(..))
import States.Models exposing (StateState, StateName)

update : Msg -> StateState -> ( StateState, Cmd Msg )
update message stateState =
    case message of
        FetchAllDone newStates ->
          let
            newModel = { stateState | states = newStates }
          in
            ( newModel, Cmd.none )

        FetchAllFail error ->
            ( stateState, Cmd.none )

        SetState newState ->
          let
            newModel = { stateState | selectedState = newState }
          in
            ( newModel, Cmd.none )
