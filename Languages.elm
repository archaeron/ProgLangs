module Languages (Language, defaultLanguages) where

type alias Language =
    { name : String
    , githubUrl : String
    , webpage : String
    , documentationUrl : Maybe String
    , apiUrl : Maybe String
    , logo: String
    , version : Maybe String
    }

pureScript =
    { name = "PureScript"
    , githubUrl = "purescript/purescript"
    , webpage = "http://www.purescript.org/"
    , documentationUrl = Just "https://leanpub.com/purescript/read"
    , apiUrl = Just "http://pursuit.purescript.org/"
    , logo = "purescript.svg"
    , version = Nothing
    }

fsharp =
    { name = "F#"
    , githubUrl = "fsharp/fsharp"
    , webpage = "http://fsharp.org/"
    , documentationUrl = Just "https://msdn.microsoft.com/en-us/library/dd233181.aspx"
    , apiUrl = Just "https://msdn.microsoft.com/en-us/library/ee353567.aspx"
    , logo = "fsharp.svg"
    , version = Nothing
    }

elm =
    { name = "Elm"
    , githubUrl = "elm-lang/elm-compiler"
    , webpage = "http://elm-lang.org/"
    , documentationUrl = Just "http://elm-lang.org/docs"
    , apiUrl = Just "http://package.elm-lang.org/packages"
    , logo = "elm.svg"
    , version = Nothing
    }

haskell =
    { name = "Haskell"
    , githubUrl = ""
    , webpage = "https://www.haskell.org/"
    , documentationUrl = Just "https://www.haskell.org/documentation"
    , apiUrl = Just "https://www.haskell.org/hoogle/"
    , logo = "haskell_purple.svg"
    , version = Nothing
    }

idris =
    { name = "Idris"
    , githubUrl = "idris-lang/Idris-dev"
    , webpage = "http://www.idris-lang.org/"
    , documentationUrl = Just "http://docs.idris-lang.org/en/latest/"
    , apiUrl = Just "http://www.idris-lang.org/docs/current/"
    , logo = ""
    , version = Nothing
    }

fstar =
    { name = "F*"
    , githubUrl = "FStarLang/FStar"
    , webpage = "https://www.fstar-lang.org/"
    , documentationUrl = Just "https://www.fstar-lang.org/tutorial/"
    , apiUrl = Nothing
    , logo = ""
    , version = Nothing
    }

frege =
    { name = "Frege"
    , githubUrl = "Frege/frege"
    , webpage = "https://github.com/Frege/frege"
    , documentationUrl = Nothing
    , apiUrl = Nothing
    , logo = ""
    , version = Nothing
    }

scala =
    { name = "Scala"
    , githubUrl = "scala/scala"
    , webpage = "http://www.scala-lang.org/"
    , documentationUrl = Just "http://www.scala-lang.org/documentation/"
    , apiUrl = Just "http://www.scala-lang.org/documentation/api.html"
    , logo = ""
    , version = Nothing
    }

clojure =
    { name = "Clojure"
    , githubUrl = "clojure/clojure"
    , webpage = ""
    , documentationUrl = Just "http://clojure.org/documentation"
    , apiUrl = Just "http://clojuredocs.org/"
    , logo = "clojure.svg"
    , version = Nothing
    }

agda =
    { name = "Agda"
    , githubUrl = "agda/agda"
    , webpage = "https://github.com/agda/agda"
    , documentationUrl = Nothing
    , apiUrl = Nothing
    , logo = ""
    , version = Nothing
    }

ocaml =
    { name = "OCaml"
    , githubUrl = "ocaml/ocaml"
    , webpage = "http://ocaml.org/"
    , documentationUrl = Just "http://caml.inria.fr/pub/docs/manual-ocaml/"
    , apiUrl = Just "https://opam.ocaml.org/packages/"
    , logo = "ocaml.svg"
    , version = Nothing
    }

defaultLanguages : List Language
defaultLanguages =
    [ pureScript
    , fsharp
    , elm
    , haskell
    , idris
    , fstar
    , frege
    , scala
    , clojure
    , agda
    , ocaml
    ]
