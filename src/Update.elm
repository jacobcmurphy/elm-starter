module Update exposing (..)

import Msgs exposing (Msg)
import Models exposing (Model)
import Navigation
import Routing exposing (parseLocation)

update : Msg -> Model -> (Model, Cmd Msg)
update msg model =
    case msg of
        Msgs.OnLocationChange location ->
            ( { model | route = parseLocation location }, Cmd.none)
        Msgs.ChangeLocation path ->
            ( model, Navigation.newUrl path )
        Msgs.NoOp ->
            ( model, Cmd.none )