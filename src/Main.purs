module Main where

import Prelude
import Control.Monad.Aff (runAff, Aff())
import Control.Monad.Eff
import Control.Monad.Eff.Console
import Control.Monad.Eff.Exception (throwException)
import Data.Maybe
import Piece
import Board
import DOM
import Halogen
import Halogen.Query (liftEff')
import Halogen.Component
import Halogen.Util (appendToBody, onLoad)
import Halogen.Driver
import Halogen.HTML.Indexed as H
import Halogen.HTML.Events.Indexed as E

data Player = P1 | P2

type Game = { turn :: Player
            , board :: Board 
            , availablePieces :: Array Piece
            , selectedPiece :: Maybe Piece}


newGame ::  Game
newGame = { turn: P1
          , board: emptyBoard
          , availablePieces: allPieces
          , selectedPiece: Nothing}

data Input a = StartGame a 
             | SomethingElse a

swapTurn :: forall r. { turn :: Player | r } -> { turn :: Player | r }
swapTurn gameState | gameState.turn == P1 = gameState { turn = P2 }
                   | otherwise            = gameState { turn = P1 }

--ui :: forall g. (Functor g) => Component Game Input g
ui :: forall g. Component Game Input (Aff (AppEffects g))
ui = component render eval where
        render :: Game -> ComponentHTML Input
        render gameState = 
            H.div_
                [ H.h1_ 
                    [ H.text "Quarto" ]
                , H.div_ (map renderPiece gameState.availablePieces)
                , H.button
                    [ E.onClick (E.input_ StartGame) ]
                    [ H.text (show gameState.turn) ]
                ]

        renderPiece :: Piece -> ComponentHTML Input
        renderPiece (Piece p) = 
            H.div
                [ E.onClick (E.input_ SomethingElse) ]
                [ H.text p.pieceText ]

        --eval :: Natural Input (ComponentDSL Game Input g)
        --eval :: Natural Input (ComponentDSL Game Input (Aff (AppEffects g)))
        eval :: Eval Input Game Input (Aff (AppEffects g))
        eval (StartGame next) = do
             modify (\state -> swapTurn state)
             pure next
        eval (SomethingElse next) = do
             liftEff' $ log "booyah"
             pure next


--turn :: Coord -> Piece -> Game -> Game
turn c p g = g

allPieces :: Array Piece
allPieces = stringToPiece <$> stringPieces where
    stringPieces = 
        [ "bssh"
        , "bsss"
        , "bsrh"
        , "bsrs"
        , "btsh"
        , "btss"
        , "btrh" , "btrs"
        , "wssh"
        , "wsss"
        , "wsrh"
        , "wsrs"
        , "wtsh"
        , "wtss"
        , "wtrh"
        , "wtrs" ]


foreign import renderObject :: forall e. Game -> Eff (dom :: DOM | e) Unit

instance showPlayer :: Show Player where
    show P1 = "P1"
    show P2 = "P2"

instance eqPlayer :: Eq Player where
    eq P1 P1 = true
    eq P2 P2 = true
    eq P1 P2 = false
    eq P2 P1 = false

type AppEffects eff = HalogenEffects (console :: CONSOLE | eff)

main :: Eff (AppEffects ()) Unit
main = runAff throwException (const (pure unit)) $ do
    app <- runUI ui newGame
    onLoad $ appendToBody app.node

--instance showGame :: Show Game where
--    show g = show g.turn ++ " :: " ++ show g.board

--import Piece
   
--type Board = Array Piece 

--get :: Int -> Int -> Board -> Maybe Piece
--get x y board = board !! (

--boardComponent :: Board -> ReactClass Unit
--boardComponent board = createClass $ spec unit \_ -> return (grid board)
--
--grid :: Board -> ReactElement
--grid board = React.DOM.div' []

--main :: forall e. Eff (dom :: DOM, console :: CONSOLE | e) Unit
--main = do
--  log "Hello sailor!"
  
--  renderObject newGame
--    body' <- getBody
--    render ui body'
--    where
--        ui = D.div' [ createFactory (boardComponent

