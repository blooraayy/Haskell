-----------------------------------------------------------------------
-- Ejercicio 1                                                       --
--   ¿Cómo evalúa Haskell la expresión “f a + b”, como “f (a + b)”,  -- 
--   como “f (a) + b” o como “f (a) + f (b)”? ¿Por qué?              --
-----------------------------------------------------------------------

{-
Evalua como "f(a) + b, por la precedencia de operadores, a la izquierda, evaluando asi la a como el argumento de la funcion, 
y despues lo que haya tras el operador "+", tomando la b
-}

-----------------------------------------------------------------------------
-- Ejercicio 2                                                             --
--   Aplica los paréntesis correspondientes a las siguientes expresiones   --
--   de tal manera que obtengas el mismo resultado que en los comentarios: --
-----------------------------------------------------------------------------

{-
2 ^ 3 * 4 -- 32
2 * 3 + 4 * 5 -- 26
2 + 3 * 4 ^ 5 -- 3074
En ninguno de las expresiones anteriores es necesario utilizar paréntesis, se evaluan correctamente
-}

------------------------------------------
-- Ejercicio 3                          --
--   Evalúa las siguientes expresiones: --
------------------------------------------

{-
4 * (7 + 2) - 3 * 9 -- 9
18 `div` 9 `mod` 2 -- 0
4 * 9 > 3 + 3 -- True
-}

-----------------------------------------------------------
-- Ejercicio 4                                           --
--   Escribe la siguiente expresión en notación prefija: --
-----------------------------------------------------------

{-
(2 - sqrt (4 + 32)) / 2

(/) ((-) 2 ((sqrt) ((+) 4 32))) 2
-}

----------------------------------------------------------------------------
-- Ejercicio 5                                                            --
--   La siguiente definición tiene tres errores sintácticos, ¿cuáles son? --
----------------------------------------------------------------------------

{-
N = a 'div' length xs
    where
      a = 10
     xs = [1,2,3,4,5]
-}

n = a `div` length xs
  where
    a = 10
    xs = [1..5]

-- Errores 3: el nombre de las funciones no puede empezar en mayúscula; cambiar 'div' por `div`; la indentación de a = 10

------------------------------------------------------------------------------------
-- Ejercicio 6                                                                    --
--   La función last del módulo Prelude permite seleccionar el último elemento    --
--   de una lista no vacía. Define una función llamada last’ que haga exactamente --
--   eso mismo pero en términos de las funciones vistas durante esta lección
------------------------------------------------------------------------------------

last' :: [a] -> a
last' [x] = x
last' (_:xs) = head (reverse xs)

---------------------------------------------------------------------------------
-- Ejercicio 7                                                                 --
--   La función init del módulo Prelude permite eliminar el último elemento de --
--   una lista no vacía. Define una función llamada init’ que haga exactamente --
--   eso mismo pero en términos de las funciones vistas durante esta lección   --
---------------------------------------------------------------------------------

init' :: [a] -> [a]
init' [x] = []
init' xs = reverse (tail (reverse xs))