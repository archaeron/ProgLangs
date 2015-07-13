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

type alias Language =
    { name : String
    , url : String
    , logo: String
    , version : Maybe String
    }

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
            H.span [] [ H.text version ]

viewLanguage : Language -> H.Html
viewLanguage language =
    H.li [ ]
        [ H.h2 [ ] [ H.text language.name ]
        , H.img [ A.src ("logos/" ++ language.logo), logoStyle ] []
        , H.div [ ] [ ]
        , H.a
            [ A.href <| githubLink language.url ]
            [ H.text language.url ]
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

defaultLanguages : List Language
defaultLanguages =
    [
        { name = "PureScript"
        , url = "purescript/purescript"
        , logo = "purescript.svg"
        , version = Nothing
        }
        ,
        { name = "F#"
        , url = "fsharp/fsharp"
        , logo = "fsharp.svg"
        , version = Nothing
        }
        ,
        { name = "Elm"
        , url = "elm-lang/elm-compiler"
        , logo = "elm.svg"
        , version = Nothing
        }
        ,
        { name = "Haskell"
        , url = ""
        , logo = "haskell_purple.svg"
        , version = Nothing
        }
        ,
        { name = "Idris"
        , url = "idris-lang/Idris-dev"
        , logo = ""
        , version = Nothing
        }
        ,
        { name = "F*"
        , url = "FStarLang/FStar"
        , logo = ""
        , version = Nothing
        }
        ,
        { name = "Frege"
        , url = "Frege/frege"
        , logo = ""
        , version = Nothing
        }
        ,
        { name = "Scala"
        , url = "scala/scala"
        , logo = ""
        , version = Nothing
        }
        ,
        { name = "Clojure"
        , url = "clojure/clojure"
        , logo = "clojure.svg"
        , version = Nothing
        }
        ,
        { name = "Agda"
        , url = "agda/agda"
        , logo = ""
        , version = Nothing
        }
        ,
        { name = "OCaml"
        , url = "ocaml/ocaml"
        , logo = "ocaml.svg"
        , version = Nothing
        }
    ]

getVersion : Language -> Task.Task Http.Error String
getVersion lang =
    Http.getString <| "https://api.github.com/repos/" ++ lang.url ++ "/git/refs/tags/"

addVersion : Language -> Task.Task Http.Error Language
addVersion lang =
    Task.map (\v -> { lang | version <- Just v }) (getVersion lang)

addVersions : List Language -> List (Task.Task Http.Error Language)
addVersions =
    List.map addVersion

--port requests : Signal (Task.Task x ())
--port requests =
--    Signal.map addVersions defaultLanguages

languages : Signal.Mailbox (List Language)
languages =
    Signal.mailbox defaultLanguages

main : Signal H.Html
main =
    Signal.map mainView languages.signal
