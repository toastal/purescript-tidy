module Bin.FormatOptions where

import Prelude

import ArgParse.Basic (ArgParser)
import ArgParse.Basic as Arg
import Data.Maybe (Maybe)
import PureScript.CST.Tidy (TypeArrowOption(..), UnicodeOption(..))

type FormatOptions =
  { indent :: Int
  , operators :: Maybe String
  , ribbon :: Number
  , typeArrowPlacement :: TypeArrowOption
  , unicode :: UnicodeOption
  , width :: Int
  }

parseFormatOptions :: ArgParser FormatOptions
parseFormatOptions =
  Arg.fromRecord
    { indent:
        Arg.argument [ "--indent", "-i" ]
          "Number of spaces to use as indentation.\nDefaults to 2."
          # Arg.int
          # Arg.default 2
    , operators:
        Arg.argument [ "--operators", "-o" ]
          "Path to an operator table generated by `generate-operators`.\nDefault is to use a pre-generated table of core and contrib."
          # Arg.unformat "FILE_PATH" pure
          # Arg.optional
    , ribbon:
        Arg.argument [ "--ribbon", "-r" ]
          "The ratio of printable width to maximum width.\nFrom 0 to 1. Defaults to 1."
          # Arg.number
          # Arg.default 1.0
    , typeArrowPlacement:
        Arg.choose "type arrow option"
          [ Arg.flag [ "--arrow-first", "-af" ]
              "Type signatures put arrows first on the line."
              $> TypeArrowFirst
          , Arg.flag [ "--arrow-last", "-al" ]
              "Type signatures put arrows last on the line.\nDefault."
              $> TypeArrowLast
          ]
          # Arg.default TypeArrowLast
    , unicode: parseUnicodeOption
    , width:
        Arg.argument [ "--width", "-w" ]
          "The maximum width of the document in columns.\nDefaults to no maximum."
          # Arg.int
          # Arg.default top
    }

parseUnicodeOption :: ArgParser UnicodeOption
parseUnicodeOption =
  Arg.choose "unicode argument"
    [ Arg.flag [ "--unicode-source", "-us" ]
        "Unicode punctuation is rendered as it appears in the source input.\nDefault."
        $> UnicodeSource
    , Arg.flag [ "--unicode-always", "-ua" ]
        "Unicode punctuation is always preferred."
        $> UnicodeAlways
    , Arg.flag [ "--unicode-never", "-un" ]
        "Unicode punctuation is never preferred."
        $> UnicodeNever
    ]
    # Arg.default UnicodeSource
