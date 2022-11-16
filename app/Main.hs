module Main (main) where

import Lib (parse, tokenize)

main :: IO ()
main = do
  input <- readLn
  case parse (tokenize input) of
    Left () -> putStrLn "Invalid input"
    Right ast -> putStrLn ("Parsed: " ++ show ast)