# Tratamiento de datos

El tratamiento de datos en Haskell presenta posibles efectos colaterales (side effects) por lo que se considera programación "impura".

Texto de referencia: Nishant Shukla. “Haskell Data Analysis Cookbook”. Packt Publishing.

## Lectura de ficheros

Utilizaremos ```readFile :: FilePath -> IO String``` para obtener la información contenida en un fichero de texto.

Fichero `fileRead1.hs`

```
main :: IO ()
main = do
    input <- readFile "input.txt"
    print $ countWords input

countWords :: String -> [Int]
countWords input = map (length . words) (lines input)
```

Si queremos que la lectura del nombre del archivo sea dinámica, utilizaremos la función ```getArgs :: IO [String]``` que devuelve los argumentos introducidos por la línea de comandos.

Fichero `fileRead2.hs`

```
import System.Environment (getArgs)
...
args <- getArgs
    let filename = case args of
        (a:_) -> a
        _ -> "input.txt"
```

### Errores en la lectura de ficheros

Si el archivo no existe se genera un error:

```*** Exception: inputs.txt: openFile: does not exist (No such file or directory)```

No se considera una buena práctica de programación que el usuario final reciba un error generado directamente por el lenguaje, sino que se debe 'traducir' a un lenguaje menos técnico.

El primer paso consiste en capturar la excepción, para lo que será necesario importar la librería que se encarga de capturarla.

Fichero `fileRead3.hs`

```
import Control.Exception (catch, SomeException)
...
input <- catch (readFile fileName)
    $ \err -> print (err::SomeException) >> return ""
```

Alternativamente podemos hacer uso de la función ```doesFileExist :: FilePath -> IO Bool``` que comprueba si el archivo existe.

```
import System.Directory (doesFileExist)
...
exists <- doesFileExist filename
input <- if exists then readFile filename else return ""
```

### Archivos CSV (Comma Separated Value)

CSV es un formato de archivo plano que almacena datos separados por comas, que se pueden denominar registros, uno por línea. Por ejemplo:

Fichero `input.csv`

```
name,age
Alex,22
Anish,22
Becca,23
...
```

Para trabajar con fichero CSV es necesario instalar la librería correspondiente [(documentación)](https://hackage.haskell.org/package/csv-0.1.2/docs/Text-CSV.html)

```
cabal install --lib csv
```

El siguiente ejemplo busca, dentro de un fichero que almacena nombres y edades, a la persona de mayor edad:

Fichero `fileRead4.hs`

```
import Text.CSV

main :: IO ()
main = do
  let fileName = "input.csv"
  input <- readFile fileName
  let csv = parseCSV fileName input
  either handleError doWork csv

handleError csv = putStrLn "not a CSV"
doWork csv = (print.findOldest.tail) (filter (\x -> length x == 2) csv)

findOldest :: [Record] -> Record
findOldest [] = []
findOldest items = foldl1 (\a x -> if age x > age a then x else a) items

age [a,b] = toInt b

toInt :: String -> Int                               
toInt = read
```

### Mónadas - introducción

Concepto matemático de los 60 redescubierto para la programación en los 90. De forma resumida, se pueden considerar como una forma de encapsular patrones recurrentes de programación de forma simplificada.

Se puede considerar también como una forma de trabajar con efectos, es decir, permiten usar programación 'impura' dentro de programación 'pura'. El uso de los efectos aparece especificado en los tipos, existiendo la posibilidad de escribir funciones que sirven para cualquier efecto (polimorfismo).

Para más información: [What is a Monad? - Computerphile - Graham Hutton](https://www.google.com/search?q=monads+graham+hutton&sxsrf=APwXEdetsEOaiuhSpheUKwYGD1lHbqm3lQ:1684105081442&source=lnms&tbm=vid&sa=X&ved=2ahUKEwjd9pKp9PX-AhVmVKQEHQN0CjEQ_AUoA3oECAEQBQ&biw=1024&bih=629&dpr=2#fpstate=ive&vld=cid:38137714,vid:t1e8gqXLbsU)

## Visualización de datos

El tratamiento de los datos se complementa con su visualización. Existen muchos tipos de gráficos y una amplia variedad de librerías disponibles para tu generación. Como introcducción nos limitaremos a los más básicos, es decir, los diagramas de líneas, de barras y de tarta. La librería que vamos a utilizar será [Chart](https://hackage.haskell.org/package/Chart). Necesitaremos instalar también las librerías necesarias para completar su funcionalidad, como son [Chart-cairo](https://hackage.haskell.org/package/Chart-chart) y [Chart-diagrams](https://hackage.haskell.org/package/Chart-diagrams).

```
cabal install --lib Chart
cabal install --lib Chart-cairo
cabal install --lib Chart-diagrams
```

Utilizando esta librería se generarán archivos `.png` que contendrán los gráficos generados por el código.

### Diagramas de líneas (Fichero exampleLineGraph.hs)

En el ejemplo se utilizan los datos obtenidos a partir de una función que simula el comportamiento de una moneda trucada con dos valores distintos, mostrándose los resultados en colores diferentes.

Para la construcción del gráfico se utiliza la función ```plot``` con el tipo ```line```, pasándose como información la etiqueta de la leyenda (```f=0.05```) y la lista de valores, que en este caso devuelve la función ```vals```.

Fichero `exampleLineGraph.png`

### Diagramas de tarta (Fichero examplePieGraph.hs)

Para el diagrama de tarta se utilizarán los datos contenidos en la lista ```values``` del propio código. En este caso se especifica el título del diagrama (```pie_title```), los valores (```pie_plot```) y los datos (```pie_data```).

Fichero `examplePieGraph.png`

### Diagramas de barras (Fichero exampleBarGraph.hs)

Para el diagrama de barras, al igual que en el caso anterior, se especificaránespecifica la lista de valores en el propio código. En este caso se deberá especificar el aspecto (```layout```), además de los datos y valores que aparecen en las barras.

Fichero `exampleBarGraph.png`