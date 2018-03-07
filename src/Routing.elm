module Routing exposing (..)

import Navigation exposing (Location)
import UrlParser exposing (..)

type Route
    = NotFoundRoute
    | CreateUserRoute
    | UserRoute String
    | EditUserRoute String

matchers : Parser (Route -> a) a
matchers =
  oneOf
    [ map CreateUserRoute top
    , map EditUserRoute (s "user" </> string </> s "edit")
    , map CreateUserRoute (s "user" </> s "create")
    , map UserRoute (s "user" </> string)
    ]

parseLocation : Location -> Route
parseLocation location =
  case (parsePath matchers location) of
    Just route ->
      route
    Nothing ->
      NotFoundRoute

createUserPath : String
createUserPath =
    "/user/create/"

userPath : String -> String
userPath userId =
    "/user/" ++ userId ++ "/"

editUserPath : String -> String
editUserPath userId =
  (userPath userId) ++ "edit"