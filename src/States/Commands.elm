module States.Commands exposing (..)

import Http
import Json.Decode as Decode exposing ((:=), at)
import Task
import States.Models exposing (State, Legislators, LegislatorData, LegislatorContact, Legislator)
import States.Messages exposing (..)


fetchLegislator : State -> Cmd Msg
fetchLegislator abbrv =
  Http.get collectionDecoder (fetchLegislatorUrl abbrv)
    |> Task.perform FetchLegislatorsFail FetchLegislatorsDone


fetchLegislatorUrl : State -> String
fetchLegislatorUrl abbrv =
  "https://www.govtrack.us/api/v2/role?current=true&state=" ++ abbrv


collectionDecoder : Decode.Decoder (Legislators)
collectionDecoder =
  ("objects" := Decode.list legislatorDataDecoder)

legislatorDataDecoder : Decode.Decoder LegislatorData
legislatorDataDecoder =
  Decode.object7 LegislatorData
    ("description" := Decode.string)
    ("extra" := legislatorContactDecoder)
    ("party" := Decode.string)
    ("person" := legislatorPersonDecoder)
    ("phone" := Decode.string)
    ("role_type" := Decode.string)
    ("website" := Decode.string)

legislatorContactDecoder : Decode.Decoder LegislatorContact
legislatorContactDecoder =
  Decode.object2 LegislatorContact
    ("office" := Decode.string)
    ( Decode.maybe ("contact_form" := Decode.string) )

legislatorPersonDecoder : Decode.Decoder Legislator
legislatorPersonDecoder =
  Decode.object6 Legislator
    ("firstname" := Decode.string)
    ("lastname" := Decode.string)
    ("link" := Decode.string)
    ("name" := Decode.string)
    (Decode.maybe ("twitterid" := Decode.string))
    (Decode.maybe ("youtubeid" := Decode.string))
