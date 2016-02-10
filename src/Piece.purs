module Piece where

import Prelude
import Data.Array
import Data.String (toCharArray)

data Color = White | Black

data Height = Tall | Short

data Shape = Square | Round

data Fill = Hollow | Solid

data Piece = Piece { pieceColor :: Color
                   , pieceHeight :: Height
                   , pieceShape :: Shape
                   , pieceFill :: Fill 
                   , pieceText :: String}

-- It seems purescript can't do cons destructing in a where block
-- so this will have to do for now
stringToPiece :: String -> Piece
stringToPiece str = stringToPiece' str $ toCharArray str
stringToPiece' :: String -> Array Char -> Piece
stringToPiece' name [c,h,s,f] = Piece { pieceColor: color, pieceHeight: height, pieceShape: shape, pieceFill: fill, pieceText: name }
    where
        color = case c of
                     'b' -> Black
                     'w' -> White
        height = case h of
                      's' -> Short
                      't' -> Tall
        shape = case s of
                     's' -> Square
                     'r' -> Round
        fill = case f of
                    'h' -> Hollow
                    's' -> Solid

instance showColor :: Show Color where
    show White = "White"
    show Black = "Black"

instance showHeight :: Show Height where
    show Tall = "Tall"
    show Short = "Short"

instance showShape :: Show Shape where
    show Round = "Round" 
    show Square = "Square"

instance showFill :: Show Fill where
    show Hollow = "Hollow"
    show Solid = "Solild"


instance showPiece :: Show Piece where
    show (Piece p) = "Color: " ++ show p.pieceColor ++ ", Height: " ++ show p.pieceHeight ++ ", Shape: " ++ show p.pieceShape ++ ", Fill: " ++ show p.pieceFill ++ ", Name: " ++ show p.pieceText

