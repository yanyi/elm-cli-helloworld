module Main exposing (main)

import Platform exposing (worker)


type alias Flags =
    {}


type alias Model =
    String


type Msg
    = Initialized


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        Initialized ->
            let
                _ =
                    Debug.log "Initialized program" "Hello World!"
            in
            ( model, Cmd.none )


init : Flags -> ( Model, Cmd msg )
init flags =
    ( "initialized", Cmd.none )


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
