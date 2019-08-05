module Main where

import Prelude

import Data.Maybe (Maybe(..))
import Effect (Effect)
import Effect.Exception (throw)
import React.Basic (Component, JSX, createComponent, make)
import React.Basic.DOM (render)
import React.Basic.DOM as R
import React.Basic.DOM.Events (capture_)
import Web.DOM.NonElementParentNode (getElementById)
import Web.HTML (window)
import Web.HTML.HTMLDocument (toNonElementParentNode)
import Web.HTML.Window (document)

component :: Component Props
component = createComponent "Counter"

type Props =
  { label :: String
  }

counter :: Props -> JSX
counter = make component { initialState, render }
  where
    initialState = { counter: 0 }

    render self =
      R.button
        { onClick: capture_ $ self.setState \s -> s { counter = s.counter + 1 }
        , children: [ R.text (self.props.label <> ": " <> show self.state.counter) ]
        }

main :: Effect Unit
main = do
  root <- getElementById "root" =<< (map toNonElementParentNode $ document =<< window)
  case root of
    Nothing -> throw "Root element not found."
    Just r -> render (counter { label: "my counter" }) r
