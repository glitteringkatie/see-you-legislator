module States.Update exposing (..)

import States.Commands exposing (fetchLegislator)
import States.Messages exposing (Msg(..))
import States.Models exposing (StateModel, LegislatorData)

isRepresentative : LegislatorData -> Bool
isRepresentative legislator =
  let
    role =
      case legislator.role_type of
        (Just roleType) -> roleType
        (Nothing) -> "no"
  in
    if role == "representative" then
       True
     else
       False

isSenator : LegislatorData -> Bool
isSenator legislator =
  let
    role =
      case legislator.role_type of
        (Just roleType) -> roleType
        (Nothing) -> "no"
  in
    if role == "senator" then
       True
     else
       False

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
            newReps =
              List.filter isRepresentative newLegislators
            newSens =
              List.filter isSenator newLegislators
            newModel =
              { model |
                representatives = newReps,
                senators = newSens
              }
          in
            ( newModel, Cmd.none )

        FetchLegislatorsFail error ->
          let one = Debug.log "error" error
          in ( { model | representatives = [], senators = [] }, Cmd.none )
