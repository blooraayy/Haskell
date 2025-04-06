------------------------------------------------------------------------------
-- Ejercicio 1                                                              --
--   Define, utilizando una lista de comprensión, una expresión que calcule --
--   la suma de los cuadrados de los n primeros números enteros.            --
------------------------------------------------------------------------------

sumCuadr :: Int -> Int
sumCuadr n = sum [ x^2 | x <- [1..n]]

--------------------------------------------------------------------------------
-- Ejercicio 2                                                                --
--   En el Apartado “Generadores” de esta Lección 5 hemos definido la función --
--   length’ utilizando un generador con variable anónima. Basándote en esa   --
--   misma definición, define una función replicate :: Int -> a -> [a] que    --
--   produce una lista de elementos idénticos. Por ejemplo:                   --
--     ghci> replicate 3 True                                                 --
--     [True, True, True]                                                     --
--------------------------------------------------------------------------------

replicate' :: Int -> a -> [a]
replicate' n x = [ x | _ <- [1..n]]

-----------------------------------------------------------------------------------
-- Ejercicio 3                                                                   --
--   Se dice que una tripla (x, y, z) de enteros positivos es pitagórica, cuando --
--   cumple con la ecuación x2 + y2 = z2 . Utilizando una lista de comprensión,  --
--   define una función pyths :: Int -> [(Int, Int, Int)] que mapee un entero    --
--   positivo n a todas las triplas pitagóricas cuyos componentes estén dentro   --
--   del rango de la lista [1..n]. Por ejemplo:                                  --
--     ghci> pyths 5                                                             --
--     [(3, 4, 5), (4, 3, 5)]                                                    --
-----------------------------------------------------------------------------------

pyths :: Int -> [(Int, Int, Int)]
pyths n = [(x, y, z) | x <- [1..n], y <- [1..n], z <- [1..n], x^2 + y^2 == z^2]

------------------------------------------------------------------------------------
-- Ejercicio 4                                                                    --
--   Se dice que un número entero positivo es perfecto cuando es igual a la suma  --
--   de todos sus factores (excluyendo el propio número). Utilizando una lista de --
--   comprensión, define una función perfects :: Int -> [Int] que devuelva una    --
--   lista con todos los números perfectos hasta un número n dado.                --
--   Por ejemplo:                                                                 --
--     ghci> perfects 500                                                         --
--     [6, 28, 496]                                                               --
--   Pista:                                                                       --
--     * Utiliza la función divisors definida en el Apartado “Guardas” de esta    --
--     Lección 5                                                                  --
------------------------------------------------------------------------------------

divisors :: Int -> [Int]
divisors n = [ x | x <- [1..n], isDivisor x]
            where isDivisor y = n `mod`y == 0

perfects :: Int -> [Int]
perfects n = [ x | x <- [1..n], sum(divisors x) - x == x]

-------------------------------------------------------------------------------
-- Ejercicio 5                                                               --
--   El producto escalar entre dos listas de números enteros (xs e ys) de    --
--   longitud n, viene dado por la suma de los productos de sus enteros.     --
--   Utilizando una lista de comprensión, define una función dot :: [Int] -> --
--   [Int] -> Int que devuelva el producto escalar entre las dos listas. Por --
--   ejemplo:                                                                --
--     ghci> dot [1,3,-5] [4,-2,-1]                                          --
--     3                                                                     --
-------------------------------------------------------------------------------

dot :: [Int] -> [Int] -> Int
dot xs ys = sum [ x * y | (x, y) <- zip xs ys]

-----------------------------------------------------------------------------
-- Ejercicio 6                                                             --
--   Demuestra cómo la siguiente lista de comprensión con dos generadores  --
--     [(x, y) | x <- [1, 2, 3], y <- [4, 5, 6]]                           --
--   puede redefinirse utilizando dos listas de comprensión donde cada una --
--   de ellas tiene un único generador. Pistas:                            --
--     * Debes utilizar la función concat del módulo Prelude               --
--     * Puedes anidar una lista de comprensión dentro de otra             --
-----------------------------------------------------------------------------

concat' :: [Int] -> [Int] -> [(Int, Int)]
concat' xs ys = [(x, y) | y <- ys | x <- xs]

---------------------------------------------------------------------------------
-- Ejercicio 7                                                                 --
--   Define una función find :: Eq a => a -> [(a, b)] -> b que toma una clave  --
--   una clave y una lista de pares clave-valor y devuelve una lista con todos --
--   los valores asociadas a dicha clave. Por ejemplo:                         --
--     ghci> find 'b' [('a', 1), ('b', 2), ('c', 3), ('b', 4)]                 --
--     [2, 4]                                                                  --
---------------------------------------------------------------------------------

find :: Eq a => a -> [(a, b)] -> [b]
find key xs = [v | (k, v) <- xs, k == key]

--------------------------------------------------------------------------------
-- Ejercicio 8                                                                --
--   Redefine la función positions del Apartado “Función zip” de esta Lección --
--   5 utilizando la función find definida en el ejercicio anterior           --
--------------------------------------------------------------------------------

find :: Eq a => a -> [(a, b)] -> [b]
find key xs = [v | (k, v) <- xs, k == key]

positions :: Eq a => a -> [a] -> [Int]
positions x xs = find x (zip xs [0..])