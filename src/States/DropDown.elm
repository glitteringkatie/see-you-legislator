module States.DropDown exposing (..)

import Html exposing (..)
import Html.Attributes exposing (class, value, href)
import Html.Events exposing (on, targetValue)
import States.Messages exposing (..)
import States.Models exposing (StateModel, Legislators, LegislatorData)
import Json.Decode as Json


view : StateModel -> Html Msg
view model =
  div []
      [ header
      , dropDown
      , printSenators model.senators
      , printReps model.representatives
      ]


header : Html Msg
header =
  div []
      [ h1 [ class "title" ] [ text "SEE YOU LEGISLATOR" ]
      , h4 [ class "subtitle" ] [ text "Contact your member of congress and make a difference!" ]
      ]

callToAction : Html Msg
callToAction =
  div []
      [ h1 [ class "h2 center" ] [ text "Who represents you? Well where are you?" ] ]

printSenators : Legislators -> Html Msg
printSenators senators =
  div [ class "legislator-section" ]
      [ h2 [ class "legislator-title" ] [ text "SENATORS" ]
      , (printLegislators senators)
      ]

printReps : Legislators -> Html Msg
printReps reps =
  div [ class "legislator-section" ]
      [ h2 [ class "legislator-title" ] [ text "REPRESENTATIVES" ]
      , (printLegislators reps)
      ]

printLegislators : Legislators -> Html Msg
printLegislators legislators =
  div [ class "legislator-tiles" ] (List.map printLegislator legislators)

listInfo : LegislatorData -> List (Html Msg)
listInfo legislator =
  let
    twitter =
      case legislator.person.twitterid of
        (Just twitterid) ->
          [ div []
                [ i [ class "fa fa-twitter" ] []
                , a [ href ( "https://twitter.com/" ++ twitterid ) ]
                    [ text ( "@" ++  twitterid ) ]
                ] ]
        (Nothing) ->
          []
    contactForm =
      case legislator.extra.contact_form of
        (Just contact_form) ->
          [ div []
                [ i [ class "fa fa-envelope" ] []
                , a [ href contact_form ]
                    [ text ( "Contact "
                           ++ legislator.person.firstname
                           ++ " "
                           ++ legislator.person.lastname
                           )
                    ]
                ] ]
        (Nothing) ->
          []
  in
    List.append twitter contactForm
      |> List.append
        [ div []
              [ i [ class "fa fa-id-badge" ] []
              , text legislator.party ]
        , div []
              [ i [ class "fa fa-phone" ] []
              , text legislator.phone ]
        , div []
              [ i [ class "fa fa-home" ] []
              ,text legislator.extra.office ]
        ]

infoLi : Html Msg -> Html Msg
infoLi info =
  li [] [ (info) ]

tileClass : String -> String
tileClass party =
  case party of
    "Democrat" ->
        "democrat tile"
    "Republican" ->
        "republican tile"
    "Green" ->
        "green tile"
    "Libertarian" ->
        "libertarian tile"
    "Independent" ->
        "independent tile"
    _ ->
        "other tile"

printLegislator : LegislatorData -> Html Msg
printLegislator legislator =
    div [ class (tileClass legislator.party) ]
        [ h3 [ class "h3 legislator-name" ] [ text legislator.person.name ]
        , ul [ class "legislator-info" ] (List.map infoLi (listInfo legislator))
        ]

dropDown : Html Msg
dropDown =
  div [ class "center p2" ]
      [ select
              [ class "select"
              , on "change" (Json.map SetState targetValue)
              ]
              [ option [ value "00" ] [ text "Find your state" ]
              , option [ value "AL" ] [ text "Alabama" ]
              , option [ value "AK" ] [ text "Alaska" ]
              , option [ value "AZ" ] [ text "Arizona" ]
              , option [ value "AR" ] [ text "Arkansas" ]
              , option [ value "CA" ] [ text "California" ]
              , option [ value "CO" ] [ text "Colorado" ]
              , option [ value "CT" ] [ text "Connecticut" ]
              , option [ value "DE" ] [ text "Delaware" ]
              , option [ value "DC" ] [ text "District Of Columbia" ]
              , option [ value "FL" ] [ text "Florida" ]
              , option [ value "GA" ] [ text "Georgia" ]
              , option [ value "HI" ] [ text "Hawaii" ]
              , option [ value "ID" ] [ text "Idaho" ]
              , option [ value "IL" ] [ text "Illinois" ]
              , option [ value "IN" ] [ text "Indiana" ]
              , option [ value "IA" ] [ text "Iowa" ]
              , option [ value "KS" ] [ text "Kansas" ]
              , option [ value "KY" ] [ text "Kentucky" ]
              , option [ value "LA" ] [ text "Louisiana" ]
              , option [ value "ME" ] [ text "Maine" ]
              , option [ value "MD" ] [ text "Maryland" ]
              , option [ value "MA" ] [ text "Massachusetts" ]
              , option [ value "MI" ] [ text "Michigan" ]
              , option [ value "MN" ] [ text "Minnesota" ]
              , option [ value "MS" ] [ text "Mississippi" ]
              , option [ value "MO" ] [ text "Missouri" ]
              , option [ value "MT" ] [ text "Montana" ]
              , option [ value "NE" ] [ text "Nebraska" ]
              , option [ value "NV" ] [ text "Nevada" ]
              , option [ value "NH" ] [ text "New Hampshire" ]
              , option [ value "NJ" ] [ text "New Jersey" ]
              , option [ value "NM" ] [ text "New Mexico" ]
              , option [ value "NY" ] [ text "New York" ]
              , option [ value "NC" ] [ text "North Carolina" ]
              , option [ value "ND" ] [ text "North Dakota" ]
              , option [ value "OH" ] [ text "Ohio" ]
              , option [ value "OK" ] [ text "Oklahoma" ]
              , option [ value "OR" ] [ text "Oregon" ]
              , option [ value "PA" ] [ text "Pennsylvania" ]
              , option [ value "RI" ] [ text "Rhode Island" ]
              , option [ value "SC" ] [ text "South Carolina" ]
              , option [ value "SD" ] [ text "South Dakota" ]
              , option [ value "TN" ] [ text "Tennessee" ]
              , option [ value "TX" ] [ text "Texas" ]
              , option [ value "UT" ] [ text "Utah" ]
              , option [ value "VT" ] [ text "Vermont" ]
              , option [ value "VA" ] [ text "Virginia" ]
              , option [ value "WA" ] [ text "Washington" ]
              , option [ value "WV" ] [ text "West Virginia" ]
              , option [ value "WI" ] [ text "Wisconsin" ]
              , option [ value "WY" ] [ text "Wyoming" ]
              ]
      ]
