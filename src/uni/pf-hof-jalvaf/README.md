# Ejercicios: Funciones de orden superior

Se incluye el archivo que contiene los ejercicios incluidos en las transparencias del tema y otros ejercicios extra. Deberán estar completados cada semana y actualizados en el respositorio GitHub correspondiente.

- Fichero `pf-hof-ex.hs`
- Fichero `pf-hof-ex-other.hs`

# Interacción con Haskell

Haskell es un lenguaje que sigue el paradigma de la programación funcional puro, lo que implica que sus funciones no tienen efectos colaterales (side effects), pero la entrada por teclado y la salida en pantalla se consideran efectos colaterales: mezcla de programación funcional 'pura' e 'impura'.

Se utiliza el tipo IO para denotar este tipo de acciones. Ejemplos:
```
IO Char -- acción de entrada/salida que devuelve un valor de tipo Char
IO ()   -- acción puramente efecto colateral, no devuelve nada
```

## Acciones básicas

La librería estándar ofrece las siguientes acciones primitivas:

```
getChar :: IO Char -- lee un caracter de teclado, lo muestra en pantalla y lo devuelve
putChar :: Char -> IO () -- muestra un caracter por pantall y lo devuelve
return :: a -> IO a -- devuelve un valor sin llevar a cabo ninguna acción
```

## Secuencias

Es posible combinar una secuencia de acciones utilizando la palabra reservada do.
Ejemplo:

```
act :: IO (Char,Char)
act = do x <- getChar
         getChar
         y <- getChar
         return (x,y)
```

## Primitivas derivadas

La librería estándar ofrece también un conjunto de primitivas derivadas de las acciones básicas:

- Leer cadenas de caracteres de teclado
```
getLine :: IO String
getLine = do x <- getChar
             if x == '\n' then
                return []
             else
                do xs <- getLine
                   return (x:xs)
```

- Escribir cadenas de caracteres en pantalla
```
putStr :: String -> IO ()
putStr []     = return ()
putStr (x:xs) = do putChar x
                   putStr xs
```

- Escribir una cadena y pasar a la siguiente línea
```
putStrLn :: String -> IO ()
putStrLn xs = do putStr xs
                 putChar '\n'
```

## Ejemplo

Acción que solicita que se introduzca por teclado una cadena y muestra como resultado su longitud.
```
strlen :: IO ()
strlen = do putStr "Enter a string: "
            xs <- getLine
            putStr "The string has "
            putStr (show (length xs))
            putStrLn " characters"

ghci> > strlen

Enter a string: Haskell
The string has 7 characters
```

## Hangman

Se incluye el código del juego del ahorcado en Haskell. El objetivo consiste en incluir comentarios en el código que expliquen qué hace cada una de las funciones de que consta esta versión del juego desde el punto de vista de la interacción con el usuario.
