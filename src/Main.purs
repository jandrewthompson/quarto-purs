module Main where

import Prelude
import Control.Monad.Eff
import Control.Monad.Eff.Console
import Data.Array (replicate, (!!))
import Data.Maybe 
import DOM 

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

