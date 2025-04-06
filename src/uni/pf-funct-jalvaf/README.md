# HUnit: Entorno de pruebas unitarias para Haskell

https://hackage.haskell.org/package/HUnit

Las pruebas unitarias tienen como objetivo comprobar la correcta ejecución del código y será el mecanismo que utilicemos para este fin. Partiendo del marco genérico de xUnit existen versiones para prácticamente todos los lenguajes de programación, siendo HUnit el de Haskell.

Los tests unitarios han demostrado ser la forma más segura de establecer las especificaciones software, pasando a considerarse pieza clave en cualquier desarrollo informático. Así surgen las metodologías actuales en las que el desarrollo de los tests tiene lugar antes del desarrollo del propio código.

Para comenzar utilizaremos el paquete HUnit de dos formas distitas:

## Creación de un Test

Para cada función en Haskell crearemos una nueva función con el nombre de la función precedido por `test`. En esa función se definirá una lista de comprobaciones identificadas con un nombre (`positive param`) y que comprueban que una determinada entrada (`double 2`) se produce una determinada salida (`4`). Será esa función la que se ejecute para comprobar si la definición de la función pasa los tests. Ejemplo:

```
testDouble :: Test
testDouble = test [
    "positive param" ~: double 2 ~?= 4,
    "negative param" ~: double (-1) ~?= (-2)
  ]
```

### Ejecución de los tests

```
ghci> runTestTT testDouble
Cases: 2  Tried: 2  Errors: 0  Failures: 0
Counts {cases = 2, tried = 2, errors = 0, failures = 0}
```

## Creación de un TestList

Para cada función en Haskell crearemos tantos `TestCase` como comprobaciones deseemos realizar y que añadiremos a una `TestList` que será la que se ejecute. Ejemplo:

```
testPositive = TestCase (assertEqual "double 2, " 4 (double 2))
testNegative = TestCase (assertEqual "double (-1), " (-2) (double (-1)))

testListDouble = TestList [TestLabel "testPositive" testPositive, TestLabel "testNegative" testNegative]
```

### Ejecución de los tests

```
ghci> runTestTT testListDouble
Cases: 2  Tried: 2  Errors: 0  Failures: 0
Counts {cases = 2, tried = 2, errors = 0, failures = 0}
```

## Ficheros de ejemplo

- Fichero `test.hs`
- Fichero `qsort.hs`

# Ejercicios: Definición de funciones

Los ejercicios se pueden llevar a cabo en el archivo .hs o en el .lhs indistintamente y deberán estar completados cada semana y actualizados en el respositorio GitHub correspondiente.

- Fichero `pf-funct-ex.hs`
- Fichero `pf-funct-ex.lhs`