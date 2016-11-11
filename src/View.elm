module View exposing (..)

import Html exposing (Html, div, text, h3)
import Html.App
import Messages exposing (Msg(..))
import Models exposing (Model)
import States.DropDown


view : Model -> Html Msg
view model =
    div []
        [ page model ]


page : Model -> Html Msg
page model =
  let
      one = Debug.log "selectedState" model.stateState.selectedState
  in
    Html.App.map StatesMsg (States.DropDown.view model.stateState.states)
