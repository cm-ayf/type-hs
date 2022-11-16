module Ast (Ast, parse) where

import Token (Token (..))

data Ast
  = AIdent String
  | AArrow Ast Ast

parse :: [Token] -> Either () Ast
parse (TIdent s : (TArrow : ts)) = do
  a <- parse ts
  pure (AArrow (AIdent s) a)
parse [TIdent s] = Right (AIdent s)
parse _ = Left ()

instance Show Ast where
  show (AIdent s) = s
  show (AArrow a b) = "(" ++ show a ++ " -> " ++ show b ++ ")"