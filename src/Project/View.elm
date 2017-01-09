module Project.View exposing (viewProjects)

import App.Update exposing (..)
import Project.Model exposing (..)
import Html exposing (..)
import Html.Attributes exposing (..)
import RemoteData exposing (RemoteData(..), WebData)
import Date exposing (..)
import Date.Format

viewProjects : WebData Project.Model.Projects -> Html Msg
viewProjects projects =
    case projects of
        Success projects ->
            div [ class "ui list" ] (List.map viewProject projects)

        Failure error ->
            div [] [ text ("Error loading data. Tip: make sure to run 'npm run api'. Message: " ++ (toString error)) ]

        NotAsked ->
            div [] [ text "Not asked yet" ]

        Loading ->
            div [ class "ui active centered inline loader" ] []


viewProject : Project -> Html Msg
viewProject project =
    let
        coordinatorCountry = case project.coordinatorCountry of
            Just coordinatorCountry' -> coordinatorCountry'
            Nothing -> "N/A"
        acronym = case project.acronym of
            Just acronym' -> acronym'
            Nothing -> "N/A"
    in
        case project.title of
            Just title ->
                div [ class "item" ]
                    [ div [ class "header" ] [ text title ]
                    , div [] [ text ("Acronym: " ++ acronym) ]
                    , div [] [ text ("Country: " ++ coordinatorCountry) ]                    
                    ]
            Nothing ->
                div [] []
