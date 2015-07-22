module Decoder (version) where

import List
import Maybe
import Json.Decode exposing (..)

type alias TagObject =
    { sha : String
    , ty : String
    , url : String
    }

type alias Tag =
    { ref : String
    , url : String
    , object : TagObject
    }

tag : Decoder String
tag = at [ "ref" ] string

tags : Decoder (List String)
tags = list tag

decodeTags : String -> Result String (List String)
decodeTags = decodeString tags

version : String -> Maybe String
version =
    decodeTags >> Result.toMaybe >> (flip Maybe.andThen) (List.reverse >> List.head)
