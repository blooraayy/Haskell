----------------------------------------------------------------------
-- Ejercicio 1                                                      --
--   Definir la función circulo :: Int -> Int tal que devuelve la   --
--   cantidad de pares de números naturales (x,y) que se encuentran --
--   dentro del círculo de radio n. Por ejemplo:                    --
--     ghci> circulo 2                                              --
--     4                                                            --
----------------------------------------------------------------------

circulo :: Int -> Int

-----------------------------------------------------------------------
-- Ejercicio 2                                                       --
--   Definir la función calculaPi :: Double -> Double que calcula el --
--   valor del número pi mediante n aproximaciones utilizando la     --
--   fórmula: 4*(1 - 1/3 + 1/5 - 1/7 + ...+ (-1)**n/(2*n+1))         --
--   Por ejemplo:                                                    --
--     ghci> calculaPi 2                                             --
--     3.466666666666667                                             --
--     ghci> calculaPi 100000                                        --
--     3.1416026534897203                                            --
-----------------------------------------------------------------------

calculaPi :: Double -> Double
calculaPi n = 4 * sum

-----------------------------------------------------------------------
-- Ejercicio 3                                                       --
--   Definir la función errorPi :: Double -> Double que calcula el   --
--   menor número de términos de la serie utilizada en el ejercicio  --
--   anterior para calcular pi necesarios para obtener el valor de   --
--   pi con un error menor que el parámetro recibido como entrada.   --
--   Por ejemplo:                                                    --
--     ghci> errorPi 0.1                                             --
--     9.0                                                           --
--     ghci> errorPi 0.0001                                          --
--     9999.0                                                        --
-----------------------------------------------------------------------

leibnizPi :: Int -> Double
leibnizPi n = 4 * sum [(-1)^k / fromIntegral (2*k + 1) | k <- [0..n-1]]

errorPi :: Double -> Double
errorPi epsilon = fromIntegral (length (takeWhile (\n -> abs (leibnizPi n - pi) >= epsilon) [1..])) + 1

-----------------------------------------------------------------------
-- Ejercicio 4                                                       --
--   Definir la función numeroDePares :: (Int, Int, Int) -> Int que  --
--   devuelve el número de elementos pares de la terna recibida.     --
--   Por ejemplo:                                                    --
--     ghci> numeroDePares (1,2,3)                                   --
--     1                                                             --
-----------------------------------------------------------------------

numeroDePares :: (Int,Int,Int) -> Int
numeroDePares (x,y,z) = length [1 | n <- [x,y,z], even n]

-----------------------------------------------------------------------
-- Ejercicio 5                                                       --
--   Dada la base de datos de informáticos ilustres se pide definir  --
--   la función nombres :: [(String,String,String,Int)] -> [String]  --
--   que devuelve el apellido de los autores contenidos en la lista  --
-----------------------------------------------------------------------

informaticos :: [(String,String,String,Int)]
informaticos =  [("Lovelace","Ada","UK",1815),
                ("Hopper","Grace","USA",1906),
                ("Backus","John","USA",1924),
                ("Minsky","Marvin","USA",1927),
                ("McCarthy","John","USA",1927),
                ("Dijkstra","Edsger W.","Netherlands",1930),
                ("Knuth","Donald","USA",1938),
                ("Leslie","Lamport","USA",1941),
                ("Ritchie","Dennis M.","USA",1941),
                ("Kernighan","Brian W.","Canada",1942),
                ("Cerf","Vinton","USA",1943),
                ("Thompson","Ken","USA",1943),
                ("Tanenbaum","Andrew S.","USA",1944),
                ("Stallman","Richard","USA",1953),
                ("Berners-Lee","Tim","UK",1955),
                ("van Rossum","Guido","Netherlands",1956),
                ("Fowler","Martin","UK",1963),
                ("Torvalds","Linus","Finland",1969)
                ]

nombres :: [(String, String, String, Int)] -> [String]
nombres xs = [apellido | (_, apellido, _, _) <- xs]

-----------------------------------------------------------------------
-- Ejercicio 6                                                       --
--   Definir nuevas funciones de búsqueda sobre la base de datos de  --
--   informáticos indicando en un comentario su funcionalidad        --
-----------------------------------------------------------------------

-- Busca la información completa del informático cuyo apellido coincide con el criterio de búsqueda.
buscarPorApellido :: String -> [(String, String, String, Int)] -> [(String, String, String, Int)]
buscarPorApellido apellido xs = [x | x@(_, ap, _, _) <- xs, ap == apellido]

-- Devuelve una lista de informáticos que provienen de un país específico.
buscarPorPais :: String -> [(String, String, String, Int)] -> [(String, String, String, Int)]
buscarPorPais pais xs = [x | x@(_, _, p, _) <- xs, p == pais]

-- Devuelve una lista de informáticos nacidos en un año específico.
buscarPorAno :: Int -> [(String, String, String, Int)] -> [(String, String, String, Int)]
buscarPorAno ano xs = [x | x@(_, _, _, a) <- xs, a == ano]

-- Devuelve una lista de informáticos nacidos en un rango de años específico.
buscarPorRangoDeAnos :: Int -> Int -> [(String, String, String, Int)] -> [(String, String, String, Int)]
buscarPorRangoDeAnos inicio fin xs = [x | x@(_, _, _, a) <- xs, a >= inicio && a <= fin]