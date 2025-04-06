{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE DeriveGeneric #-}

import Data.Csv
import Data.List
import GHC.Generics
import qualified Data.Vector as V
import qualified Data.ByteString.Lazy as BL

--player_name,club,position,minutes_played,match_played,goals,assists,distance_covered
data Player = Player
    { player_name :: String
    , club :: String
    , position :: String
    , minutes_played :: Int
    , match_played :: Int
    , goals :: Int
    , assists :: Int
    , distance_covered :: Float
    }
    deriving (Generic, Show)

instance FromNamedRecord Player
instance ToNamedRecord Player

type ErrorMsg = String
type CsvData = (Header, V.Vector Player)

main :: IO ()
main = do
    csvData <- BL.readFile "key_stats.csv"
    case decodeByName csvData of
        Left err -> putStrLn err
        Right (_, v) -> doWork v

positions :: [String]
positions = ["Defender","Forward","Goalkeeper","Midfielder"]

-- == --
-- Número de registros contenidas en el fichero csv --
-- 747
doWork :: V.Vector Player -> IO ()
doWork = print . length
-- == --