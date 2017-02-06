module Project.Model exposing (..)

import Json.Decode as JD exposing ((:=))
import String exposing (toInt, toFloat)

type alias Id = Int

type alias Project =
    { title : Maybe String
    , acronym : Maybe String
    , coordinatorCountry : Maybe String
    , ecMaxContribution : Maybe String
    }

type alias Projects =
    List Project

decodeProject : JD.Decoder Project
decodeProject =
    JD.object4 Project
        (JD.maybe ("title" := JD.string))
        (JD.maybe ("acronym" := JD.string))        
        (JD.maybe ("coordinatorCountry" := JD.string))
        (JD.maybe ("ecMaxContribution" := JD.string))
