module User.Edit exposing (..)

import Html exposing (..)
import Models exposing (User)
import Msgs exposing (Msg)

view : Maybe User -> Html Msg
view user =
    case user of
        Just val ->
            div []
                [ text ("Edit user id: " ++ val.id) ]
        Nothing ->
            div []
                [ text "Edit user not found" ]