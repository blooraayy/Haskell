------------------------------------------------------------------
-- Ejercicio 1                                                  --
--   Identifica el tipo de datos de las siguientes expresiones  --
------------------------------------------------------------------

['a', 'b', 'c']
--[Char] ó String
('a', 'b', 'c')
--(Char)
[(False, '0'), (True, '1')]
--[(Bool, Char)]
([False, True], ['0', '1'])
--([Bool], [Char])
[tail, init, reverse]
--[[a] -> [a]]
["False", "True"]
--[String]
([False, True], False)
--([Bool], Bool)
("1, 2", "3, 4")
--(String)
[(1, True), (0, False)]
--[(Int, Bool)]

---------------------------------------------------------------------------
-- Ejercicio 2                                                           --
--   ¿Son válidas las siguientes listas y tuplas? ¿Por qué o por qué no? --
---------------------------------------------------------------------------

[1, 2, 3] ++ 4
-- No es valida porque el operador ++ se utiliza para concatear listas, y esto es una lista de Int y un dato de tipo Int
[[1, 2], 3, [4, 5]]
-- No, porque para que fuera una lista válida, el 3 deberia tambien estar dentro de otro lista
[tail, head, reverse]
-- Si es valido, las funciones en haskell son tipos de datos
[]:[]
--No, ya que el operador : se ultiliza para crear una lista o añadir un solo elemento al principio de la lista
["hola"]:[1]:[]
--No, por lo mismo de antes
(4, 4)
-- Si, es valida
(tail, head, reverse)
-- Si es valida
(True, "PFyED", "IA")
-- Si es valida, una tupla admite diferentes tipo de datos dentro de ella
()
-- No es valido, una tupla no puede ser vacia

----------------------------------------------------------------
-- Ejercicio 3                                                --
--   Identifica el tipo de datos de las siguientes funciones: --
----------------------------------------------------------------

second :: [a] -> a
second xs = head (tail xs)

swap :: (a, b) -> (b, a)
swap (x,y) = (y, x)

pair :: a -> b -> (a, b)
pair x y = (x, y)

double :: Int -> Int
double x = x * 2

palindrome :: [a] -> Bool
palindrome xs = reverse xs == xs

twice :: (a -> a) -> a -> a
twice f x = f (f x)

f :: [a] -> [a]
f xs = take 3 (reverse xs) -- Devuelve una lista de los tres ultimos elementos

-----------------------------------------------------------------
-- Ejercicio 4                                                 --
--   ¿De qué tipo es la función sum definida en la Lección 1?  --
--   ¿Y las funciones last’ e init’ definidas en la Lección 2? --
-----------------------------------------------------------------

sum :: Num a => [a] -> a

last :: [a] -> a

init :: [a] -> [a] 
--------------------------------------------------------------------------------
-- Ejercicio 5                                                                --
--   ¿Cuántos argumentos tiene una función f si su signatura es la siguiente? --
--   f :: a -> b -> c -> d                                                    --
--------------------------------------------------------------------------------

{- La función tendrá tres argumentos, ya que cada letra representa un tipo de dato diferente, por lo tanto hay tres datos
a, b, c como parametros de entrada y d que sería el de salida. Ademas viene dado por el numero de flechas entre las diferentes
letras que indican los tipos de datos -}