module Token (Token (..), tokenize) where

data Token
  = TIdent String
  | TArrow

tokenize :: String -> [Token]
tokenize s = map toToken (words s)

toToken :: String -> Token
toToken "->" = TArrow
toToken s = TIdent s
