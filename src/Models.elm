module Models exposing (..)

import Routing exposing (Route)

type alias Model =
    { route : Route
    , currentUser : Maybe User
    }

initialModel : Route -> Model
initialModel route =
    { route = route
    , currentUser = Nothing
    }

type alias User =
    { id : String
    , displayName : String
    }