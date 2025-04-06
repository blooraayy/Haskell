--------------------------------------------------------------------------
-- Ejercicio 1                                                          --
--   Demuestra que la lista por comprensión [f x | x <- xs, p x] puede  --
--   redefinirse en términos de las funciones map y filter.             --
--------------------------------------------------------------------------

map f (filter p xs)

--------------------------------------------------------------------------
-- Ejercicio 2                                                          --
--   Redefine las siguientes funciones del módulo Prelude:              --
--   ▷ all :: Foldable t => (a -> Bool) -> t a -> Bool, que determina   --
--     si todos los elementos de una lista satisfacen un predicado      --
--   ▷ any :: Foldable t => (a -> Bool) -> t a -> Bool, que determina   --
--     si algún elemento de una lista satisface un predicado            --
--   ▷ takeWhile :: (a -> Bool) -> [a] -> [a], que toma los elementos   --
--     de una lista mientras satisfagan un predicado                    --
--   ▷ dropWhile :: (a -> Bool) -> [a] -> [a], que descarta los         --
--     elementos de una lista mientras satisfagan un predicado          --
--------------------------------------------------------------------------

all :: (a -> Bool) -> [a] -> Bool
all _ []     = True
all p (x:xs) = p x && all p xs

any :: (a -> Bool) -> [a] -> Bool
any _ []     = False
any p (x:xs) = p x || any p xs

takeWhile :: (a -> Bool) -> [a] -> [a]
takeWhile _ [] = []
takeWhile p (x:xs)
    | p x       = x : takeWhile p xs
    | otherwise = []

dropWhile :: (a -> Bool) -> [a] -> [a]
dropWhile _ [] = []
dropWhile p (x:xs)
    | p x       = dropWhile p xs
    | otherwise = x:xs

--------------------------------------------------------------------------
-- Ejercicio 3                                                          --
--   Redefine las funciones map y filter utilizando la función foldr    --
--------------------------------------------------------------------------

map :: (a -> b) -> [a] -> [b]
map f = foldr (\x acc -> f x : acc) []

filter :: (a -> Bool) -> [a] -> [a]
filter p = foldr (\x acc -> if p x then x : acc else acc) []

--------------------------------------------------------------------------
-- Ejercicio 4                                                          --
--   Utilizando la función foldl, define la función dec2int :: [Int]    --
--   -> Int, que convierte un número decimal expresado en una lista     --
--   como un número entero. Por ejemplo:                                --
--     ghci> dec2int [2, 3, 4, 5]                                       --
--     2345                                                             --
--------------------------------------------------------------------------

dec2int :: [Int] -> Int
dec2int = foldl (\acc x -> acc * 10 + x) 0

--------------------------------------------------------------------------
-- Ejercicio 5                                                          --
--    Explica porque la siguiente definición no es válida:              --
--      sumsqreven = compose [sum, map (^2), filter even]               --
--------------------------------------------------------------------------

sumsqreven :: [Int] -> Int
sumsqreven = sum . map (^2) . filter even

--------------------------------------------------------------------------
-- Ejercicio 6                                                          --
--   Define la función curry del módulo Prelude, que convierte una      --
--   función sobre pares en una función currificada. De forma análoga,  --
--   define la función uncurry que convierte una función currificada de --
--   dos argumentos en una función sobre pares. Pista: primero indica   --
--   la signatura de ambas funciones.                                   --
--------------------------------------------------------------------------

curry :: ((a, b) -> c) -> a -> b -> c
curry f x y = f (x, y)

uncurry :: (a -> b -> c) -> (a, b) -> c
uncurry f (x, y) = f x y