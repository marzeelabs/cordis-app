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
    "http://localhost:4000/db"

