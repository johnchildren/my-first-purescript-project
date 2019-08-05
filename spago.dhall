{-
Welcome to a Spago project!
You can edit this file as you like.
-}
{ name =
    "my-first-purescript-project"
, dependencies =
    [ "effect", "console", "psci-support", "react-basic" ]
, packages =
    ./packages.dhall
, sources =
    [ "src/**/*.purs", "test/**/*.purs" ]
}
