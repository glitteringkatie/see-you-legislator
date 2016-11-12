module States.DropDown exposing (..)

import Html exposing (..)
import Html.Attributes exposing (class, value)
import Html.Events exposing (on, targetValue)
import States.Messages exposing (..)
import States.Models exposing (StateModel, Legislators, LegislatorData)
import Json.Decode as Json


view : StateModel -> Html Msg
view model =
  div []
      [ callToAction
      , dropDown
      , printLegislators model.senators
      , printLegislators model.representatives
      ]


callToAction : Html Msg
callToAction =
  div []
      [ h3 [ class "h3 center" ] [ text "Who represents you? Well where are you?" ] ]

printLegislators : Legislators -> Html Msg
printLegislators legislators =
  div [] (List.map printLegislator legislators)

listInfo : LegislatorData -> List String
listInfo legislator =
  let
    twitter =
      case legislator.person.twitterid of
        (Just twitterid) ->
          [ twitterid ]
        (Nothing) ->
          []
    youtube =
      case legislator.person.youtubeid of
        (Just youtubeid) ->
          [ youtubeid ]
        (Nothing) ->
          []
    contactForm =
      case legislator.extra.contact_form of
        (Just contact_form) ->
          [ contact_form ]
        (Nothing) ->
          []
  in
    List.append twitter youtube
      |> List.append contactForm
      |> List.append
        [ legislator.description
        , legislator.party
        , legislator.website
        , legislator.phone
        , legislator.extra.office
        , legislator.role_type
        ]

infoLi : String -> Html Msg
infoLi info =
  li [] [ text info ]

printLegislator : LegislatorData -> Html Msg
printLegislator legislator =
    div []
        [ h3 [ class "h3" ] [ text legislator.person.name ]
        , ul [] (List.map infoLi (listInfo legislator))
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
