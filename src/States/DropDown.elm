module States.DropDown exposing (..)

import Html exposing (..)
import Html.Attributes exposing (class)
import Html.Events exposing (on, targetValue)
import States.Messages exposing (..)
import States.Models exposing (State)
import Json.Decode as Json


view : List State -> Html Msg
view states=
    div []
        [ callToAction
        , dropDown states
        ]


callToAction : Html Msg
callToAction =
  div []
      [ h3 [ class "h3 center" ] [ text "Who represents you? Well where are you?" ] ]

dropDown : List State -> Html Msg
dropDown states =
    div [ class "center p2" ]
        [ select
                [ class "select"
                , on "change" (let one = Debug.log "target" (Json.map SetState targetValue) in Json.map SetState targetValue)
                ]
                (List.map statesOption states)
        ]


statesOption : State -> Html Msg
statesOption state =
  option [] [ text state.name ]

