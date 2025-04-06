import Data.Csv
import GHC.Generics
import qualified Data.Vector as V
import qualified Data.ByteString.Lazy as BL

data Person = Person 
    { name   :: String 
    , salary :: Int 
    } deriving (Generic, Show)

instance FromNamedRecord Person
instance ToNamedRecord Person

type ErrorMsg = String
type CsvData = (Header, V.Vector Person)

main :: IO ()
main = do
    csvData <- BL.readFile "salaries.csv"
    case decodeByName csvData of
        Left err -> putStrLn err
        Right (_, v) -> doWork v

doWork :: V.Vector Person -> IO ()
doWork v = print v
--doWork v = print $ V.length v
--doWork v = print $ V.map (\r -> name r) v
--doWork v = print $ V.length $ V.filter (\p -> name p == "John") v
--doWork v = print $ V.head v
--doWork v = V.forM_ v $ \ p ->
--  putStrLn $ name p ++ " earns " ++ show (salary p) ++ " $/year"

