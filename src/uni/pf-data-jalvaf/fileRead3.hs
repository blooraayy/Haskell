import System.Environment (getArgs)
import Control.Exception (catch, SomeException)
import System.Directory (doesFileExist)

main :: IO ()
main = do
    args <- getArgs
    let fileName = case args of
            (a:_) -> a
            _ -> "input.txt"

    exists <- doesFileExist fileName
    input2 <- if exists then readFile fileName else return ""

    input <- catch (readFile fileName)
           $ \err -> print (err::SomeException) >> return ""
    print $ countWords input
  
countWords :: String -> [Int]
countWords input = map (length.words) (lines input)