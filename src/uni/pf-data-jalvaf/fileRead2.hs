import System.Environment (getArgs)

main :: IO ()
main = do
  args <- getArgs
  let fileName = case args of
        (a:_) -> a
        _ -> "input.txt"
        
  input <- readFile fileName
  print $ countWords input
  
countWords :: String -> [Int]
countWords input = map (length.words) (lines input)
