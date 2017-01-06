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

maybeStringDecoder : String -> Decode.Decoder (Maybe String)
maybeStringDecoder toDecode =
  Decode.maybe ( toDecode := Decode.string )

legislatorDataDecoder : Decode.Decoder LegislatorData
legislatorDataDecoder =
  Decode.object7 LegislatorData
    ( maybeStringDecoder "description" )
    ("extra" := legislatorContactDecoder)
    ( maybeStringDecoder "party" )
    ("person" := legislatorPersonDecoder)
    ( maybeStringDecoder "phone" )
    ( maybeStringDecoder "role_type" )
    ( maybeStringDecoder "website" )

legislatorContactDecoder : Decode.Decoder LegislatorContact
legislatorContactDecoder =
  Decode.object2 LegislatorContact
    ( maybeStringDecoder "office" )
    ( maybeStringDecoder "contact_form" )

legislatorPersonDecoder : Decode.Decoder Legislator
legislatorPersonDecoder =
  Decode.object5 Legislator
    ( maybeStringDecoder "firstname" )
    ( maybeStringDecoder "lastname" )
    ( maybeStringDecoder "link" )
    ( maybeStringDecoder "name" )
    ( maybeStringDecoder "twitterid" )
