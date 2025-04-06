import Text.CSV
import Data.List

main :: IO ()
main = do
    let fileName = "goalscorers.csv"
    input <- readFile fileName
    let csv = parseCSV fileName input
    either handleError doWork csv

handleError csv = putStrLn "error parsing"

-- date,home_team,away_team,team,scorer,minute,own_goal,penalty

date :: Record -> String
date [a,b,c,d,e,f,g,h] = a

homeTeam :: Record -> String
homeTeam [a,b,c,d,e,f,g,h] = b

awayTeam :: Record -> String
awayTeam [a,b,c,d,e,f,g,h] = c

team :: Record -> String
team [a,b,c,d,e,f,g,h] = d

scorer :: Record -> String
scorer [a,b,c,d,e,f,g,h] = e

minute :: Record -> Int
minute [a,b,c,d,e,f,g,h] = toInt f

ownGoal :: Record -> String
ownGoal [a,b,c,d,e,f,g,h] = g

penalty :: Record -> String
penalty [a,b,c,d,e,f,g,h] = h

toInt :: String -> Int
toInt = read

-- == --
-- Número de registros contenidas en el fichero csv --
-- 44120
--doWork = print . length
-- == --

-- == --
-- Numero de penaltis
-- 2944
-- doWork = print . numPenalty
-- == --

-- == --
-- Número de penaltis pitados al equipo de casa
-- 1861
-- doWork = print . length . filterHome . filterPenalty
-- == --

-- == --
-- Número de penaltis que ha marcado un pais en casa
-- Ejemplo: España
-- 36
-- doWork = print . length . filterHome . filterPenalty . goalsTeam "Spain"
-- == --

-- == --
-- ¿Qué país ha marcado menos goles (sin ser de penalti)?
-- "Yemen"
doWork = print . name . maxGoals . goalsPerTeam . group . orderedTeams . filterPenalty . filterHeader
-- == --

isPenalty :: Record -> Bool
isPenalty record = penalty record == "FALSE"

filterPenalty :: [Record] -> [Record]
filterPenalty = filter ( (== "TRUE") . penalty)

filterHeader :: [Record] -> [Record]
filterHeader = tail

qsort :: Ord a => [a] -> [a]
qsort [] = []
qsort (a:as) = qsort left ++ [a] ++ qsort right
  where (left,right) = (filter (<=a) as, filter (>a) as)

orderedTeams :: [Record] -> [String]
orderedTeams = qsort . map team

goalsPerTeam :: [[String]] -> [(String, Int)]
goalsPerTeam xss = zip (map head xss) (map length xss)

maxGoals :: [(String, Int)] -> (String,Int)
maxGoals = foldl1 (\(x,y) (a,b) -> if y < b then (x,y) else (a,b))

name :: (String, Int) -> String
name (a,_) = a