{-# LANGUAGE OverloadedStrings     #-}
{-# LANGUAGE QuasiQuotes           #-}
{-# LANGUAGE TemplateHaskell       #-}
{-# LANGUAGE TypeFamilies          #-}
import           Yesod

data HelloWorld = HelloWorld

mkYesod "HelloWorld" [parseRoutes|
/ HomeR GET
/about AboutR GET
/info InfoR GET
|]

instance Yesod HelloWorld

getHomeR :: Handler Html
getHomeR = defaultLayout [whamlet|<a href=@{AboutR}>About Page!</a><a href=@{InfoR}>Info Page!</a>|]

getAboutR :: Handler Html
getAboutR = defaultLayout [whamlet|About Page!|]

getInfoR :: Handler Html
getInfoR = defaultLayout [whamlet|Info Page!|]

main :: IO ()
main = warp 3000 HelloWorld
