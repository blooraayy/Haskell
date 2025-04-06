# Ejercicios: Tipo de datos y clases

Se incluye el archivo que contiene los ejercicios incluidos en las transparencias del tema. Deberán estar completados cada semana y actualizados en el respositorio GitHub correspondiente.

- Fichero `pf-dataTypes-ex.hs`

# Uso de tipos de datos para el tratamiento de ficheros CSV

Nota: Los paquetes que no estén instalados se instalarán haciendo uso de `cabal`.

Utilizaremos la librería cassava (https://hackage.haskell.org/package/cassava), que ofrece los elementos necesarios para realizar conversiones entre registros y tipos de datos definidos por el usuario. El ejemplo que utilizaremos será el del fichero `salaries.csv`:

```
name,salary
John,50000
Jane,60000
```

Habitualmente, los fichero csv incluyen una cabecera que especifica el nombre de los campos que incluye cada uno de los registros contenidos por línea. En este caso, el nombre y el sueldo.

Para representar esa información será necesario definir el siguiente tipo de datos:

```
data Person = Person 
    { name   :: String 
    , salary :: Int 
    } deriving (Generic, Show)
```

De forma automática se crea una función para cada uno de los campos de la persona, de modo que, por ejemplo, `name` aplicado a un registro devuelve el valor de ese campo.

```
ghci> name Person {name = "John", salary = 50000}
"John"
```

Para poder llevar a cabo transformaciones entre registro y tipo de dato y a la inversa (`encode` y `decode`), se utilizarán las clases `FromNamedRecord` y `ToNamedRecord`, de la librería cassava, ya que hemos elegido referirnos a los campos de los registros por nombre, declarando el tipo `Person` como instancia de dichas clases:

```
instance FromNamedRecord Person
instance ToNamedRecord Person
```

Dado que estamos trabajando con la entrada/salida (programación impura), será necesario definir otros dos tipos para representar el posible error que puede surgir al leer un fichero csv, y el tipo de dato que obtendremos si la lectura tiene éxito. En este último caso obtendremos un objeto de tipo `Vector` de elementos de tipo `Person` (https://hackage.haskell.org/package/vector-0.13.1.0/docs/Data-Vector.html).

```
type ErrorMsg = String
type CsvData = (Header, V.Vector Person)
```

La lectura de fichero se lleva a cabo utilizando `Lazy ByteString` ya que ofrece una implementación mucho más eficiente (https://hackage.haskell.org/package/bytestring-0.12.1.0/docs/Data-ByteString-Lazy.html).

El resultado de la lectura puede ser un error, si el archivo, por ejemplo, no respeta el formato establecido en la cabecera, en cuyo caso se muestra por consola el error encontrado. Si la lectura tiene éxito, entonces se obtiene una representación del contenido del archivo en el que aparece en primer lugar la cabecera, y a continuación los datos ya en formato de vector de personas. A partir de ese momento se plantea la función `doWork` para poder llevar a cabo las operaciones deseadas. Ejemplo: mostrar el número de registros contenidos en el archivo.

```
main :: IO ()
main = do
    csvData <- BL.readFile "salaries.csv"
    case decodeByName csvData of
        Left err -> putStrLn err
        Right (_, v) -> doWork v

doWork :: V.Vector Person -> IO ()
doWork v = print $ V.length v
```

Otros ejemplos:

Importante: Nótese que al trabajar con `Vector`, se deberán utilizar las funciones definidas en `Data.Vector`

- Mostrar los nombres de todos los registros
```
doWork v = print $ V.map (\r -> name r) v
```
- Mostrar cuántos registros hay a nombre de John
```
doWork v = print $ V.length $ V.filter (\p -> name p == "John") v
```
- Mostrar el contenido del archivo en forma de frases compuestas
```
doWork v = V.forM_ v $ \ p ->
  putStrLn $ name p ++ " earns " ++ show (salary p) ++ " $/year"
```