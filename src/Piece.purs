module Piece where

import Prelude

data Color = White | Black

data Height = Tall | Short

data Shape = Square | Round

data Fill = Hollow | Solid

data Piece = Piece { pieceColor :: Color
                   , pieceHeight :: Height
                   , pieceShape :: Shape
                   , pieceFill :: Fill }

somePiece :: Piece
somePiece = Piece
 { pieceColor: White
 , pieceHeight: Tall
 , pieceShape: Round
 , pieceFill: Hollow }

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
    show (Piece p) = "Color: " ++ show p.pieceColor ++ ", Height: " ++ show p.pieceHeight ++ ", Shape: " ++ show p.pieceShape ++ ", Fill: " ++ show p.pieceFill

