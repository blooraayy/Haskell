# ghcid: Errores en tiempo real

https://hackage.haskell.org/package/ghcid

Herramienta que sirve para comprobar los errores existentes en un fichero Haskell cada vez que se graba su contenido. Lo utilizaremos desde un terminal de Visual Studio Code. El objetivo es que la herramienta muestre el mensaje `All good`, indicando que el código no contiene errores.

Instalación:

`cabal install ghcid`

Uso: (para el archivo `Main.hs`)

`ghcid "--command=ghci Main.hs"`


# Depuración en Haskell

https://downloads.haskell.org/~ghc/7.4.1/docs/html/users_guide/ghci-debugger.html

Comenzaremos haciendo uso del depurador que contiene GHCi y que permite incluir puntos de ruptura (*breakpoints*) en el código y hacer una ejecución paso a paso mientras se inspecciona el valor de las variables locales. El objetivo será confirmar que conocemos en detalle la forma en la que tiene lugar la ejecución del código Haskell.

- Fichero `debug.hs`

Utilizando este sencillo ejemplo llevaremos a cabo la  secuencia en la que colocamos un *breakpoint* (`:break`) y lanzamos la ejecución para comprobar los valores de las variables `a` y `b` y hacer una ejecución paso a paso (`:step`) hasta finalizar.

```
ghci> :break 5
Breakpoint 0 activated at debug.hs:5:5-18
ghci> test
123
456
Stopped in Main.test, debug.hs:5:5-18
_result :: IO () = _
a :: String = _
b :: String = _
[debug.hs:5:5-18] ghci> a
"123"
[debug.hs:5:5-18] ghci> b
"456"
[debug.hs:5:5-18] ghci> :step
"Stopped in Main.test, debug.hs:5:13-18
_result :: [Char] = _
a :: String = "123"
b :: String = "456"
[debug.hs:5:13-18] ghci> a
"123"
[debug.hs:5:13-18] ghci> b
"456"
[debug.hs:5:13-18] ghci> :step
123456"
ghci> 
```

## Ejercicio de depuración:
Llevar a cabo la ejecución paso a paso del código explicando qué ocurre en cada uno de los pasos.

- Fichero `qsort.hs`


# Proyectos en Haskell

https://www.haskell.org/cabal/

Para la creación de proyectos utilizaremos `cabal` siguiendo la siguiente secuencia, aunque por ahora no vayamos a ejecutarlos, seleccionando en principio las opciones por defecto.

```
$ mkdir myproject
$ cd myproject
$ cabal init
$ cabal run
```

# Ejercicios: Introducción a la programación en Haskell

Los ejercicios se pueden llevar a cabo en el archivo .hs o en el .lhs indistintamente y deberán estar completados cada semana y actualizados en el respositorio GitHub correspondiente.

- Fichero `pf-intro-ex.hs`
- Fichero `pf-intro-ex.lhs`


# Ejercicios: Tipos de datos y clases de tipos

Los ejercicios se pueden llevar a cabo en el archivo .hs o en el .lhs indistintamente y deberán estar completados cada semana y actualizados en el respositorio GitHub correspondiente.

- Fichero `pf-types-ex.hs`
- Fichero `pf-types-ex.lhs`