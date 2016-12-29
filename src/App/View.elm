module App.View exposing (view)

import App.Model exposing (Model)
import App.Update exposing (..)
import Project.View exposing (..)
import Html exposing (..)
import Html.Attributes exposing (..)

view : App.Model.Model -> Html Msg
view model =
    div [ ]
        [ h2 [ class "ui dividing header" ] [ text "Projects" ]
        , Project.View.viewProjects model.projects
        ]




