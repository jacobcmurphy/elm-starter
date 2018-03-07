module View exposing (view)

import Html exposing (Html, div, text)
import Models exposing (Model)
import Msgs exposing (Msg)
import Routing exposing (..)
import User.Show
import User.Edit
import User.Create

view : Model -> Html Msg
view model =
    div []
        [ page model ]

page : Model -> Html Msg
page model =
    case model.route of
        Routing.CreateUserRoute ->
            User.Create.view model.currentUser
        Routing.UserRoute userId ->
            User.Show.view model.currentUser
        Routing.EditUserRoute userId ->
            User.Edit.view model.currentUser
        Routing.NotFoundRoute ->
            notFoundView

notFoundView : Html msg
notFoundView =
  div []
      [ text "Not found"
      ]