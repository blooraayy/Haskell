EJERCICIOS - OPERADORES Y FUNCIONES
  Operadores aritméticos
  Operadores comparativos
  Operadores lógicos
  Operadores listas
  Funciones listas
  Prelude

OPERADORES ARITMÉTICOS + - * / div mod rem quot ^ ^^ **

Orden de evaluación de expresiones

> 2 * 3 ^ 4
> 162
> 2 * (3 ^ 4)
> 162
> (2 * 3) ^ 4
> 1296
> 2 + 3 * 4
> 14
> (2 + 3) * 4
> 20
> sqrt 3 ^ 2 + 4 ^ 2
> 19.0
> sqrt (3 ^ 2 + 4 ^ 2)
> 5.0

OPERADORES COMPARATIVOS == /= < <= >= >

> 2 == 3
False

> 2 < 3
True

> 2 > 3
False

> 3 /= 2
True

> 3 <= 2
False

OPERADORES LÓGICOS && ||

> True && True
True

> True || True
True

> False && True
False

OPERADORES LISTAS !! : ++

> "Hola " ++ "mundo"
Hola mundo

FUNCIONES LISTAS head tail take drop length sum product reverse

> head [1, 2, 3]
1

PRELUDE