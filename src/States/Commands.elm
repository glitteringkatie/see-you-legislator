module States.Commands exposing (..)

import Http
import Json.Decode as Decode exposing ((:=))
import Task
import States.Models exposing (State)
import States.Messages exposing (..)


fetchAll : Cmd Msg
fetchAll =
    Http.get collectionDecoder fetchAllUrl
        |> Task.perform FetchAllFail FetchAllDone


fetchAllUrl : String
fetchAllUrl =
    "http://openstates.org/api/v1/metadata/"


collectionDecoder : Decode.Decoder (List State)
collectionDecoder =
    Decode.list stateDecoder


stateDecoder : Decode.Decoder State
stateDecoder =
    Decode.object2 State
        ("name" := Decode.string)
        ("abbreviation" := Decode.string)

