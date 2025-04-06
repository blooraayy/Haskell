import Text.CSV
import Data.List

main :: IO ()
main = do
    let fileName = "key_stats.csv"
    input <- readFile fileName
    let csv = parseCSV fileName input
    either handleError doWork csv

handleError csv = putStrLn "error parsing"

--player_name,club,position,minutes_played,match_played,goals,assists,distance_covered

player_name :: Record -> String
player_name [a,b,c,d,e,f,g,h] = a

club :: Record -> String
club [a,b,c,d,e,f,g,h] = b

position :: Record -> String
position [a,b,c,d,e,f,g,h] = c

minutes_played :: Record -> Int 
minutes_played [a,b,c,d,e,f,g,h] = toInt d

match_played :: Record -> Int
match_played [a,b,c,d,e,f,g,h] = toInt e

goals :: Record -> Int
goals [a,b,c,d,e,f,g,h] = toInt f

assists :: Record -> Int
assists [a,b,c,d,e,f,g,h] = toInt g

distance_covered :: Record -> Float
distance_covered [a,b,c,d,e,f,g,h] = toFloat h

toInt :: String -> Int
toInt = read

toFloat :: String -> Float
toFloat = read

positions :: [String]
positions = ["Defender","Forward","Goalkeeper","Midfielder"]

-- Función principal para encontrar al jugador con más goles en la posición Midfielder
doWork :: [Record] -> IO ()
doWork = print . name . maxGoals . goalsPerPlayer . filterPosition . filterHeader

filterHeader :: [Record] -> [Record]
filterHeader = tail

filterPosition :: [Record] -> [Record]
filterPosition = filter (\r -> position r == "Midfielder")

goalsPerPlayer :: [Record] -> [(String, Int)]
goalsPerPlayer records = map (\r -> (player_name r, goals r)) records

maxGoals :: [(String, Int)] -> (String, Int)
maxGoals [] = ("", 0)
maxGoals xs = foldl (\acc (name, goals) -> if goals > second acc then (name, goals) else acc) ("", 0) xs

name :: (String, Int) -> String
name (a, _) = a

second :: (a,b) -> b
second (_,y) = y