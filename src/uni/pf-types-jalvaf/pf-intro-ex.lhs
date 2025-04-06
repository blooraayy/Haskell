----------------------------------------------------------------------
-- Ejercicio 1                                                      --
--   ¿Cómo evalúa Haskell la expresión “f a + b”, como “f (a + b)”, -- 
--   como “f (a) + b” o como “f (a) + f (b)”? ¿Por qué?             --
----------------------------------------------------------------------

-- Evalua como "f(a) + b, por la precedencia de operadores, a la izquierda, evaluando asi la a como el argumento de la funcion, 
-- y despues lo que haya tras el operador "+", tomando la b

-----------------------------------------------------------------------------
-- Ejercicio 2                                                             --
--   Aplica los paréntesis correspondientes a las siguientes expresiones   --
--   de tal manera que obtengas el mismo resultado que en los comentarios: --
-----------------------------------------------------------------------------

> (2 ^ 3) * 4 -- 32
> 2 * 3 + 4 * 5 -- 26
> 2 + 3 * 4 ^ 5 -- 3074
-- No es necesario poner parentesis en los dos ultimos apartados

------------------------------------------
-- Ejercicio 3                          --
--   Evalúa las siguientes expresiones: --
------------------------------------------

> 4 * (7 + 2) - 3 * 9
9
> 18 `div` 9 `mod` 2
0
> 4 * 9 > 3 + 3
True

-----------------------------------------------------------
-- Ejercicio 4                                           --
--   Escribe la siguiente expresión en notación prefija: --
-----------------------------------------------------------

> (2 - `sqrt` (4 + 32)) / 2
> (/) ((-) 2 ((sqrt) ((+) 4 32))) 2


----------------------------------------------------------------------------
-- Ejercicio 5                                                            --
--   La siguiente definición tiene tres errores sintácticos, ¿cuáles son? --
----------------------------------------------------------------------------

> n = a `div` length xs
>   where 
>       a = 10
>       xs = [1,2,3,4,5]

-- Los errores eran la indentacion de a = 10; la varibale n no puede ser mayuscula; cambiar 'div' por `div`

------------------------------------------------------------------------------------
-- Ejercicio 6                                                                    --
--   La función last del módulo Prelude permite seleccionar el último elemento    --
--   de una lista no vacía. Define una función llamada last’ que haga exactamente --
--   eso mismo pero en términos de las funciones vistas durante esta lección
------------------------------------------------------------------------------------

> last' :: [a] -> a
> last' [x] = x -- un unico elemento
> last' (_:xs) = xs

---------------------------------------------------------------------------------
-- Ejercicio 7                                                                 --
--   La función init del módulo Prelude permite eliminar el último elemento de --
--   una lista no vacía. Define una función llamada init’ que haga exactamente --
--   eso mismo pero en términos de las funciones vistas durante esta lección   --
---------------------------------------------------------------------------------

init' :: [a] -> [a] -- entra y sale una lista
init' [x] = [] -- caso con un elemento
init' (y:ys) = 