module Languages (Language, defaultLanguages) where

type alias Language =
    { name : String
    , url : String
    , logo: String
    , version : Maybe String
    }

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
