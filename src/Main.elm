module Main exposing (main)

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
            let
                _ =
                    Debug.log "Initialized program" txt
            in
            ( model, Cmd.none )


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


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none
