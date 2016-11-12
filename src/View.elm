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
  Html.App.map StatesMsg (States.DropDown.view model.stateModel.legislators)
