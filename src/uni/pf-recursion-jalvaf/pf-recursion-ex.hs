-------------------------------------------------------------------------------
-- Ejercicio 1                                                               --
--  Define una función recursiva sumdown que devuelva la suma de los números --
--  enteros positivos desde un valor dado hasta 0. Por ejemplo:              --
--    ghci> sumdown 3                                                        --
--    6                                                                      --
-------------------------------------------------------------------------------

    sumdown :: Int -> Int
    sumdown 0 = 0
    sumdown n = n + sumdown (n - 1)

-------------------------------------------------------------------------------
-- Ejercicio 2                                                               --
--  Define una función recursiva power análoga al operador de potencia (^)   --
--  pero para números enteros positivos. Por ejemplo:                        --
--    ghci> power 2 3                                                        --
--    8                                                                      --
--  Pista:                                                                   --
--    Sigue el mismo patrón de recursión que el visto en el Apartado         --
--    “Recursión en Haskell” de esta Lección 6 para definir el operador      --
--    de multiplicación (*)                                                  --
-------------------------------------------------------------------------------

    power :: Int -> Int -> Int
    power _ 0 = 1
    power x n = x * power x (n - 1)

-------------------------------------------------------------------------------
-- Ejercicio 3                                                               --
--  Define una función recursiva euclid que implemente el algoritmo de       --
--  Euclides para calcular el máximo común divisor de dos números enteros    --
--  positivos i :                                                            --
--    Si los dos números son iguales el resultado es el propio número        --
--    Si no, restar el número pequeño al grande y repetir el proceso         --
--  Por ejemplo:                                                             --
--    ghci> euclid 6 27                                                      --
--    3                                                                      --
-------------------------------------------------------------------------------

euclid :: Int -> Int -> Int
    euclid x y
        | x == y    = x
        | x > y     = euclid (x - y) y
        | otherwise = euclid x (y - x)

-------------------------------------------------------------------------------
-- Ejercicio 4                                                               --
--  Define las siguientes funciones de forma recursiva:                      --
--    sum (calcula la suma de una lista de números)                          --
--    take (extrae un número de elementos del principio de una lista)        --
--    last (selecciona el último elemento de una lista no vacía)             --
-------------------------------------------------------------------------------

sum' :: [Int] -> Int
    sum' []     = 0  
    sum' (x:xs) = x + sum' xs  


    take' :: Int -> [a] -> [a]
    take' _ []     = []  
    take' n _ | n <= 0 = []  
    take' n (x:xs) = x : take' (n - 1) xs  

    last' :: [a] -> a
    last' [x]    = x 
    last' (_:xs) = last' xs  

-------------------------------------------------------------------------------
-- Ejercicio 5                                                               --
--  Define las siguientes funciones sobre listas utilizando recursividad:    --
-- (1) Determina si todos los valores lógicos de una lista son True          --
-- and :: [Bool] -> Bool                                                     --
-- (2) Concatena una lista de listas                                         --
-- concat :: [[a]] -> [a]                                                    --
-- (3) Devuelve una lista con n elementos idénticos                          --
-- replicate :: Int -> a -> [a]                                              --
-- (4) Devuelve el enésimo elemento de una lista                             --
-- (!!) :: [a] -> Int -> a                                                   --
-- (5) Determina si un valor es un elemento de la lista                      --
-- elem :: Eq a => a -> [a] -> Bool                                          --
-------------------------------------------------------------------------------

and' :: [Bool] -> Bool
    and' []     = True  
    and' (x:xs) = x && and' xs


    concat' :: [[a]] -> [a]
    concat' []       = []  
    concat' (x:xs)   = x ++ concat' xs  


    replicate' :: Int -> a -> [a]
    replicate' n x
        | n <= 0    = [] 
        | otherwise = x : replicate' (n - 1) x  

    (!!?) :: [a] -> Int -> a
    (x:_)  !!? 0 = x
    (_:xs) !!? n = xs !!? (n - 1)

    elem' :: Eq a => a -> [a] -> Bool
    elem' _ []     = False  
    elem' y (x:xs) = y == x || elem' y xs  

--------------------------------------------------------------------------------
-- Ejercicio 6                                                                --
--  Utilizando las definiciones recursivas dadas en esta Lección 6, demuestra -- 
--  cómo evaluar las siguientes expresiones utilizando tanto el método de     --
--  sustitución como el del árbol de recursión                                --
--    length [1, 2, 3]                                                        --
--    drop 3 [1, 2, 3, 4, 5]                                                  --
--    init [1, 2, 3]                                                          --
--------------------------------------------------------------------------------

    length [1, 2, 3]
    = 1 + length [2, 3]
    = 1 + (1 + length [3])
    = 1 + (1 + (1 + length []))
    = 1 + (1 + (1 + 0))
    = 1 + (1 + 1)
    = 1 + 2
    = 3



    drop 3 [1, 2, 3, 4, 5]
    = drop 2 [2, 3, 4, 5]
    = drop 1 [3, 4, 5]
    = drop 0 [4, 5]
    = [4, 5]

    init [1, 2, 3]
    = 1 : init [2, 3]
    = 1 : (2 : init [3])
    = 1 : (2 : [])
    = [1, 2]

-------------------------------------------------------------------------------
-- Ejercicio 7                                                               --
--  Define una función recursiva merge que fusione dos listas ordenadas en   --
--  una única lista ordenada. Por ejemplo:                                   --
--    ghci> merge [2, 5, 6] [1, 3, 4]                                        --
--    [1, 2, 3, 4, 5, 6]                                                     --
-------------------------------------------------------------------------------

merge :: Ord a => [a] -> [a] -> [a]
    merge [] ys = ys
    merge xs [] = xs
    merge (x:xs) (y:ys)
        | x <= y    = x : merge xs (y:ys)
        | otherwise = y : merge (x:xs) ys

-------------------------------------------------------------------------------
-- Ejercicio 8                                                               --
--  Define una función recursiva msort que implemente el algoritmo de        --
--  ordenación merge sort. Para ello, debes saber que:                       --
--    Una lista está ordenada cuando es vacía o de tipo singleton            --
--    En el resto de los casos, la lista se ordena fusionando dos sublistas  --
--      ya ordenadas que resultan de partir a la mitad la lista inicial      --
--  Pistas:                                                                  --
--    Para dividir una lista en dos sublistas debes utilizar la función      --
--      halve definida en el Ejercicio 1 propuesto durante la Lección 4      --
--      (Definición de Funciones)                                            --
--    Para fusionar dos sublistas debes utilizar la función merge definida   --
--      en el ejercicio anterior                                             --
-------------------------------------------------------------------------------

msort :: Ord a => [a] -> [a]
    msort []       = []  
    msort [x]      = [x] 
    msort xs       = merge (msort left) (msort right)
        where (left, right) = halve xs

    halve :: [a] -> ([a], [a])  
    halve xs = splitAt (length xs `div` 2) xs