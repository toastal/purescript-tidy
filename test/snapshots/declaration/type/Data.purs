module Data where

data Void

data Unit =

 Unit

data One a = One a

data Tuple a b = Tuple    a     b

data Maybe a = Nothing            | Just a

data Either a b
  = Left a
  | Right b

data ManyArgs a b c d e f =
  ManyArgs a b
       c
     d
    e
      f
