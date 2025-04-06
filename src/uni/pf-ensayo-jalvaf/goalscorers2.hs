{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE DeriveGeneric #-}

import Data.Csv
import GHC.Generics
import qualified Data.Vector as V
import qualified Data.ByteString.Lazy as BL

-- date,home_team,away_team,team,scorer,minute,own_goal,penalty

data Scorer = Scorer
    { date :: String
    , home_team :: String
    , away_team :: String
    , team :: String
    , scorer :: String
    , minute :: String
    , own_goal :: String
    , penalty :: String
    } 
    deriving (Generic, Show)

instance FromNamedRecord Scorer
instance ToNamedRecord Scorer

type ErrorMsg = String
type CsvData = (Header, V.Vector Scorer)

main :: IO ()
main = do
    csvData <- BL.readFile "goalscorers.csv"
    case decodeByName csvData of
        Left err -> putStrLn err
        Right (_, v) -> doWork v

-- Número de registros contenidas en el fichero csv --
-- 44120
doWork :: V.Vector Scorer -> IO ()
doWork v = print $ length v