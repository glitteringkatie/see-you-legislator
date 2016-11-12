module States.Messages exposing (..)

import Http
import States.Models exposing (State, Legislators)


type Msg
    = SetState State
    | FetchLegislatorsDone (Legislators)
    | FetchLegislatorsFail Http.Error
