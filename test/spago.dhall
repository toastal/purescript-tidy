{ name = "purescript-tidy-test"
, dependencies =
  [ "aff"
  , "ansi"
  , "argonaut-codecs"
  , "argonaut-core"
  , "argparse-basic"
  , "arrays"
  , "bifunctors"
  , "console"
  , "control"
  , "datetime"
  , "dodo-printer"
  , "effect"
  , "either"
  , "exceptions"
  , "foldable-traversable"
  , "foreign-object"
  , "lazy"
  , "lists"
  , "maybe"
  , "newtype"
  , "node-buffer"
  , "node-child-process"
  , "node-fs-aff"
  , "node-path"
  , "node-process"
  , "node-workerbees"
  , "ordered-collections"
  , "partial"
  , "posix-types"
  , "prelude"
  , "purescript-language-cst-parser"
  , "node-glob-basic"
  , "strings"
  , "transformers"
  , "tuples"
  ]
, packages = ../packages.dhall
, sources = [ "src/**/*.purs", "test/*.purs", "bin/Bin/*.purs", "bin/DefaultOperators.purs" ]
}
