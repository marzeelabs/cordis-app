module App.Model exposing (emptyModel, headlessServer, Model)

import Project.Model exposing (..)
import RemoteData exposing (RemoteData(..), WebData)

type alias Model =
    { projects : WebData Project.Model.Projects
    }

emptyModel : Model
emptyModel =
  { projects = Loading
  }

headlessServer : String
headlessServer =
    --"http://localhost:4000/db"
    "https://5e5qfaxb1c.execute-api.eu-west-1.amazonaws.com/dev/graphql"

