------------------------------------------------------------------------
-- Ejercicio 1                                                        --
--   Define, en términos de funciones del módulo Prelude, una función --
--   halve :: [a] -> ([a], [a]) que divida una lista de longitud par  --
--   en dos listas. Por ejemplo:                                      --
--     ghci> halve [1, 2, 3, 4, 5, 6]                                 --
--     ([1, 2, 3], [4, 5, 6])                                         --
--   Puedes utilizar la función splitAt del módulo Prelude            --
------------------------------------------------------------------------

halve :: [a] -> ([a], [a])
halve xs = splitAt (length xs `div` 2) xs 

---------------------------------------------------------------------------
-- Ejercicio 2                                                           --
--   Considera la función safetail :: [a] -> [a], equivalente a tail del --
--   módulo Prelude, pero con la diferencia que safetail mapea la lista  --
--   vacía a sí misma y tail da error en ese mismo caso. Definir dicha   --
--   función de tres maneras distintas utilizando:                       --
--     (1) if-then-else                                                  --
--     (2) ecuaciones de guarda                                          --
--     (3) pattern matching                                              --
--   Deberás utilizar la función null del módulo Prelude.                --
---------------------------------------------------------------------------


----------------------------------------------------------------------
-- Ejercicio 3                                                      --
--   Define, en términos de pattern matching, el operador lógico    --
--   or’ :: Bool -> Bool -> Bool cuyo funcionamiento es exactamente --
--   el mismo que la función or y el operador || del módulo Prelude --
----------------------------------------------------------------------



------------------------------------------------------------------------
-- Ejercicio 4                                                        --
--   Redefine, en términos de expresiones condicionales, la siguiente --
--   versión del operador and definida mediante pattern matching      --
--     True `and` True = True                                         --
--     _ `and` _ = False                                              --
------------------------------------------------------------------------


---------------------------------------------------------------------------
-- Ejercicio 5                                                           --
--   Haz lo mismo que en el ejercicio anterior, pero siendo la expresión --
--     True `and` b = b                                                  --
--     False `and` _ = False                                             --
---------------------------------------------------------------------------


-----------------------------------------------------------------------------
-- Ejercicio 6                                                             --
--   Demuestra que la función currificada mult x y z = x * y * z puede ser --
--   expresada en términos de expresiones lambda                           --
-----------------------------------------------------------------------------



---------------------------------------------------------------------------
-- Ejercicio 7                                                           --
--   El área de un cilindro está definido por la expresión:              --
--     Acilindro = Abases + Alateral = (2πr 2 ) + (2πrh)                 --
--   siendo r el radio de la base y h la altura del cilindro. Define una --
--   función cylinderArea :: Float -> Float -> Float que calcule el área --
--   de un cilindro tomando como argumentos r y h pero de tal manera que --
--   Abases y Alateral sean expresiones lambda. Por ejemplo:             --
--     ghci> cylinderArea 2 5                                            --
--     87.96459430051421                                                 --
---------------------------------------------------------------------------

