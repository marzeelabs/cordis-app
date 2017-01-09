module App.Update exposing (init, update, Msg(..))

import App.Model exposing (Model, emptyModel)
import Project.Model exposing (..)
import Http
import RemoteData exposing (RemoteData(..), WebData)
import Json.Decode as JD exposing ((:=))
import Task

type Msg
    = FetchResponse (WebData Projects)

init : ( App.Model.Model, Cmd Msg )
init =
  ( emptyModel, fetch )


update : Msg -> App.Model.Model -> ( App.Model.Model, Cmd Msg )
update msg model =
    case msg of
        FetchResponse response ->
            ({model | projects = response}, Cmd.none)

fetch : Cmd Msg
fetch =
    Http.post decodeData App.Model.headlessServer (Http.string """{ "query": "{ project { rcn, title } }" }""")
        |> RemoteData.asCmd
        |> Cmd.map FetchResponse

decodeData : JD.Decoder Project.Model.Projects
decodeData =
    JD.at [ "data" ] <| JD.at [ "project" ] <| JD.list <| Project.Model.decodeProject


