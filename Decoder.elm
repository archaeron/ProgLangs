module Decoder (version) where

import Json.Decode exposing (..)

version : String -> Result String (List String)
version =
    decodeString <| list string
