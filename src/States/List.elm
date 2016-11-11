module States.List exposing (..)

import Html exposing (..)
import Html.Attributes exposing (class)
import States.Messages exposing (..)
import States.Models exposing (State)


view : List State -> Html Msg
view states =
    div []
        [ nav states
        , list states
        ]


nav : List State -> Html Msg
nav states =
    div [ class "clearfix mb2 white bg-black" ]
        [ div [ class "left p2" ] [ text "States" ] ]


list : List State -> Html Msg
list states =
    div [ class "p2" ]
        [ table []
            [ thead []
                [ tr []
                    [ th [] [ text "Name" ]
                    , th [] [ text "Abbreviation" ]
                    ]
                ]
            , tbody [] (List.map statesRow states)
            ]
        ]


statesRow : State -> Html Msg
statesRow state =
    tr []
        [ td [] [ text state.name ]
        , td [] [ text state.abbreviation ]
        ]

