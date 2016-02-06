module Main where

import Prelude
import Control.Monad.Eff
import Control.Monad.Eff.Console
import Data.Maybe 
import Piece
import Board
import DOM 

data Player = P1 | P2

type Game = { turn :: Player
            , board :: Board }

newGame ::  Game
newGame = { turn: P1, board: emptyBoard }

instance showPlayer :: Show Player where
    show P1 = "P1"
    show P2 = "P2"

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

main :: forall e. Eff (console :: CONSOLE | e) Unit
main = do
  log "Hello sailor!"
--    body' <- getBody
--    render ui body'
--    where
--        ui = D.div' [ createFactory (boardComponent

