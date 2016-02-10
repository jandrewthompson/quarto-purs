module Board where

import Prelude 
import Piece (Piece)
import Data.Maybe (Maybe(Just, Nothing))
import Data.Map as M

data Coord = Coord Int Int

type Space = Maybe Piece

type Board = M.Map Coord Piece

emptyBoard :: Board
emptyBoard = M.empty

setPiece :: Coord -> Piece -> Board -> Board
setPiece = M.insert

getSpace :: Coord -> Board -> Space
getSpace = M.lookup

isSpaceAvailable :: Coord -> Board -> Boolean
isSpaceAvailable c b = result where
    space = getSpace c b
    result = case space of
                  Nothing -> true
                  Just _  -> false

instance showCoord :: Show Coord where
    show (Coord x y) = "Row: " ++ show x ++ ", Column: " ++ show y

instance eqCoord :: Eq Coord where
    eq (Coord x1 y1) (Coord x2 y2) = if x1 == x2 then eq y1 y2 else eq x1 x2

instance compareCoord :: Ord Coord where
    compare (Coord x1 y1) (Coord x2 y2) = if x1 == x2 then compare y1 y2 else compare x1 x2
