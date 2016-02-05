module Board where

import Prelude
import Piece
import Data.Maybe
import Data.Array (replicate)

type Space = Maybe Piece

type Board = Array (Array Space)

emptyRow :: Array Space
emptyRow = replicate 4 Nothing

emptyBoard :: Board
emptyBoard = replicate 4 emptyRow

instance showCoord :: Show Coord where
    show (Coord x y) = "Row: " ++ show x ++ ", Column: " ++ show y
