------------------------------------------------------------------
-- Ejercicio 1                                                  --
--   Identifica el tipo de datos de las siguientes expresiones  --
------------------------------------------------------------------

> ['a', 'b', 'c']
> ('a', 'b', 'c')
> [(False, '0'), (True, '1')]
> ([False, True], ['0', '1'])
> [tail, init, reverse]
> ["False", "True"]
> ([False, True], False)
> ("1, 2", "3, 4")
> [(1, True), (0, False)]


---------------------------------------------------------------------------
-- Ejercicio 2                                                           --
--   ¿Son válidas las siguientes listas y tuplas? ¿Por qué o por qué no? --
---------------------------------------------------------------------------

> [1, 2, 3] ++ 4
> [[1, 2], 3, [4, 5]]
> [tail, head, reverse]
> []:[]
> ["hola"]:[1]:[]
> (4, 4)
> (tail, head, reverse)
> (True, "PFyED", "IA")
> ()


----------------------------------------------------------------
-- Ejercicio 3                                                --
--   Identifica el tipo de datos de las siguientes funciones: --
----------------------------------------------------------------

> second xs = head (tail xs)
> swap (x,y) = (y, x)
> pair x y = (x, y)
> double x = x * 2
> palindrome xs = reverse xs == xs
> twice f x = f (f x)
> f xs = take 3 (reverse xs)


-----------------------------------------------------------------
-- Ejercicio 4                                                 --
--   ¿De qué tipo es la función sum definida en la Lección 1?  --
--   ¿Y las funciones last’ e init’ definidas en la Lección 2? --
-----------------------------------------------------------------


--------------------------------------------------------------------------------
-- Ejercicio 5                                                                --
--   ¿Cuántos argumentos tiene una función f si su signatura es la siguiente? --
--   f :: a -> b -> c -> d                                                    --
--------------------------------------------------------------------------------
