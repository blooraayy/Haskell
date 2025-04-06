--------------------------------------------------------------------------
-- Ejercicio 1                                                          --
--  Define una función recursiva insert que inserte un elemento en una  --
--  lista ordenada de manera ordenada. Ejemplo:                         --
--   ghci> insert 4 [2, 6, 8]                                           --
--   [2 ,4 ,6 ,8 ]                                                      --
--------------------------------------------------------------------------

insert :: Ord a => a -> [a] -> [a]
insert x [] = [x]  -- Caso base: si la lista está vacía, simplemente devuelve una lista con el elemento x.
insert x (y:ys)
    | x <= y    = x : y : ys  -- Si x es menor o igual que el primer elemento de la lista, inserta x antes de y.
    | otherwise = y : insert x ys  -- En otro caso, compara x con el siguiente elemento de la lista.

--------------------------------------------------------------------------
-- Ejercicio 2                                                          --
--  Definir la función recursiva digitos :: Integer -> [Integer] que    --
--  genere la lista con los dígitos del número entero recibido como     --
--  parámetro. Ejemplo:                                                 --
--   ghci> digitos 49628                                                --
--   [4 ,9 ,6 ,2 ,8 ]                                                   --
--------------------------------------------------------------------------

digitos :: Integer -> [Integer]
digitos n
    | n < 10    = [n]  -- Caso base: si el número es menor que 10, simplemente devuelve una lista con ese único dígito.
    | otherwise = digitos (n `div` 10) ++ [n `mod` 10]  -- En caso contrario, extrae el último dígito con n `mod` 10 y llama recursivamente a la función con n `div` 10 para los dígitos restantes.


--------------------------------------------------------------------------
-- Ejercicio 3                                                          --
--  Define una función recursiva sumaDigitos que devuelva la suma de    --
--  los dígitos de un número entero dado. Ejemplo:                      --
--   ghci> sumaDigitos 49628                                            --
--   29                                                                 --
--------------------------------------------------------------------------

sumaDigitos :: Integer -> Integer
sumaDigitos n = sum (digitos n)

--------------------------------------------------------------------------
-- Ejercicio 4                                                          --
--  Define una función recursiva numeroLista que a partir de una lista  --
--  de dígitos del 0 al 9 devuelva el número entero que forman dichos   --
--  dígitos. Ejemplo:                                                   --
--   ghci> numeroLista [4, 9, 6, 2, 8]                                  --
--   49628                                                              --
--------------------------------------------------------------------------

numeroLista :: [Integer] -> Integer
numeroLista [] = 0
numeroLista (x:xs) = x * 10^(length xs) + numeroLista xs
---------------------------------------------------------------------------
-- Ejercicio 5                                                           --
--  Define una función recursiva histogram que, a partir de una lista de --
--  dígitos del 0 al 9, muestre el histograma de las apariciones de cada --
--  uno de ellos. Se deberá utilizar la función putStr para mostrar el   --
--  resultado del histograma de forma visual con los caracteres de salto --
--  de línea (\n). Ejemplo:                                              --
--   ghci> putStr (histogram [1, 4, 2, 5, 4, 1, 4])                      --
--       *                                                               --
--    *  *                                                               --
--    ** **                                                              --
--   ==========                                                          --
--   0123456789                                                          --
---------------------------------------------------------------------------
