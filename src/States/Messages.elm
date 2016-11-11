module States.Messages exposing (..)

import Http
import States.Models exposing (StateName, State)


type Msg
    = FetchAllDone (List State)
    | FetchAllFail Http.Error
    | SetState String
