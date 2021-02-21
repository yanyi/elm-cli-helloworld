port module Main exposing (main)

import Platform exposing (worker)
import Task


type alias Flags =
    {}


type alias Model =
    String


type Msg
    = Initialized String


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        Initialized txt ->
            -- Send the `log` port on Initialized. See index.js.
            ( model, log ("Initialized program: " ++ txt) )


init : Flags -> ( Model, Cmd Msg )
init flags =
    ( "initialized", Task.perform Initialized (Task.succeed "Hello World!") )


main =
    Platform.worker
        { init = init
        , update = update
        , subscriptions = subscriptions
        }



---


subscriptions : Model -> Sub msg
subscriptions model =
    Sub.none


port log : String -> Cmd msg
