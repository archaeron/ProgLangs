module Main where

import Html as H
import Html.Attributes as A
import Html.Events as E
import Signal
import List
import Debug
import Maybe
import Http
import Task
import Task.Extra
import Decoder
import Languages exposing (..)

versions : String -> Task.Task Http.Error String
versions url = Http.getString url

logoStyle : H.Attribute
logoStyle = A.style
    [ ("width", "50px") ]

githubLink : String -> String
githubLink = (++) "https://github.com/"

viewVersion : Maybe String -> H.Html
viewVersion v =
    case v of
        Nothing ->
            H.span [] [ H.text "no version found" ]
        Just version ->
            H.span []
                [ H.text version ]

viewDocumentation : Maybe String -> H.Html
viewDocumentation url =
    case url of
        Nothing ->
            H.div [] [ H.text "no documentation" ]
        Just u ->
            H.div []
                [ H.a
                   [ A.href u ]
                   [ H.text "Documentation" ]
                ]

viewApi : Maybe String -> H.Html
viewApi url =
    case url of
        Nothing ->
            H.div [] [ H.text "no API" ]
        Just u ->
            H.div []
                [ H.a
                   [ A.href u ]
                   [ H.text "API" ]
                ]

viewLanguageName : String -> String -> H.Html
viewLanguageName name webpage =
    H.a
       [ A.href webpage ]
       [ H.h2 [ ] [ H.text name ] ]

viewLanguage : Language -> H.Html
viewLanguage language =
    H.li [ ]
        [ viewLanguageName language.name language.webpage
        , H.img [ A.src ("logos/" ++ language.logo), logoStyle ] []
        , viewDocumentation language.documentationUrl
        , viewApi language.apiUrl
        , H.div [ ] [ ]
        , H.a
            [ A.href <| githubLink language.githubUrl ]
            [ H.text language.githubUrl ]
        , H.div
            []
            [ viewVersion language.version
            ]
        ]

viewLanguages : List Language -> H.Html
viewLanguages languages =
    H.div [ ]
        [ H.ul [ ] <| List.map viewLanguage languages
        ]

mainView : List Language -> H.Html
mainView languages =
    H.div [ A.class "container" ]
        [ H.h1 [] [ H.text "Languages" ]
        , viewLanguages languages
        ]

getVersion : String -> Task.Task Http.Error (Maybe String)
getVersion url =
    "https://api.github.com/repos/" ++ url ++ "/git/refs/tags/"
        |> Http.getString
        |> Task.map Decoder.version

addVersion : Language -> Task.Task Http.Error Language
addVersion lang =
    Task.map (\v -> { lang | version <- v }) (getVersion lang.githubUrl)

addVersions : List Language -> Task.Task Http.Error (List Language)
addVersions =
    Task.Extra.optional << List.map addVersion

report : List Language -> Task.Task x ()
report =
    Signal.send languages.address

port requests : Task.Task Http.Error ()
port requests =
    (addVersions defaultLanguages) `Task.andThen` report

languages : Signal.Mailbox (List Language)
languages =
    Signal.mailbox defaultLanguages

main : Signal H.Html
main =
    Signal.map mainView languages.signal
