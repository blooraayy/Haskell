----------------------------------------------------------------------
-- Ejercicio 1                                                      --
--   Partiendo de la definición recursiva del tipo de número        --
--   naturales Nat, se pide la función recursiva de multiplicación  --
--   mult :: Nat -> Nat -> Nat. Ejemplo:                            --
--     ghci> mult (Succ Zero) (Succ Zero)                           --
--     Succ Zero                                                    --
--   Pista: utilizar la función add en la definición de mult.       --
-----------------------------------------------------------------------

data Nat = Zero | Succ Nat deriving (Show, Eq)

add :: Nat -> Nat -> Nat
add Zero n = n
add (Succ m) n = Succ (add m n)

mult :: Nat -> Nat -> Nat
mult Zero _ = Zero
mult (Succ m) n = add n (mult m n)

----------------------------------------------------------------------
-- Ejercicio 2                                                      --
--   El módulo prelude define el tipo de datos                      --
--     data Ordening = LT | EQ | GT}                                --
--   junto con la función                                           --
--     compare :: Ord a => a -> a -> Ordering                       --
--   A partir de la definición de árbol como                        --
--     data Tree a = Leaf a | Node (Tree a) a (Tree a)              --
--   se pide definir la función                                     --
--     occurs :: Ord a => a -> Tree a -> Bool                       --
--   que devuelve True si el parámetro recibido forma parte del     --
--   árbol y False en caso contrario. Ejemplo:                      --
--     ghci> :{                                                     --
--     ghci| t :: Tree Int                                          --
--     ghci| t = Node (Node (Leaf 1) 3 (Leaf 4))                    --
--     ghci|          5                                             --
--     ghci|          (Node (Leaf 6) 7 (Leaf 9))                    --
--     ghci| :}                                                     --
--     ghci> occurs 2 t                                             --
--     False                                                        --
--     ghci> occurs 3 t                                             --
--     True                                                         --
----------------------------------------------------------------------

data Tree a = Leaf a | Node (Tree a) a (Tree a) deriving (Show)

occurs :: Ord a => a -> Tree a -> Bool
occurs x (Leaf y) = x == y
occurs x (Node left y right) =
  case compare x y of
    LT -> occurs x left  -- Si x es menor que y, buscar en el subárbol izquierdo
    EQ -> True           -- Si x es igual a y, hemos encontrado el elemento
    GT -> occurs x right -- Si x es mayor que y, buscar en el subárbol derecho

----------------------------------------------------------------------
-- Ejercicio 3                                                      --
--   Partiendo de la definición de árbol binario como               -- 
--     data Tree a = Leaf a | Node (Tree a) (Tree a)                --
--   se dice que el árbol está balanceado si el número de hojas     --
--   en el subárbol derecho y en el izquierdo difiere como mucho    --
--   en una. Se pide definir la función                             --
--     balanced :: Tree a -> Bool                                   --
--   que decide si el árbol está balanceado o no. Ejemplo:          --
--     ghci> :{                                                     --
--     ghci| t :: Tree Int                                          --
--     ghci| t = Node (Node (Leaf 1) (Leaf 4))                      --
--     ghci|          (Node (Leaf 6) (Leaf 9))                      --
--     ghci| :}                                                     --
--     ghci> balanced t                                             --
--     True                                                         --
--     ghci> :{                                                     --
--     ghci| t' :: Tree Int                                         --
--     ghci| t' = Node (Node (Leaf 1)                               --
--     ghci|                 (Leaf 4))                              --
--     ghci|           (Node (Leaf 6)                               --
--     ghci|                 (Node (Leaf 7)                         --
--     ghci|                       (Node (Leaf 8)                   --
--     ghci|                             (Leaf 9))))                --
--     ghci| :}                                                     --
--     ghci> balanced t'                                            --
--     False                                                        --
----------------------------------------------------------------------

data Tree a = Leaf a | Node (Tree a) (Tree a) deriving (Show)

countLeaves :: Tree a -> Int
countLeaves (Leaf _) = 1
countLeaves (Node left right) = countLeaves left + countLeaves right

balanced :: Tree a -> Bool
balanced (Leaf _) = True
balanced (Node left right) =
  abs (countLeaves left - countLeaves right) <= 1 && balanced left && balanced right

----------------------------------------------------------------------
-- Ejercicio 4                                                      --
--   Se pide definir la función                                     --
--     balance :: [a] -> Tree                                       --
--   que convierte una lista no vacía en un árbol balanceado.       --
--   Pista: definir antes una función que separa la lista en dos    --
--   partes cuya longitud difiere como mucho en un elemento.        --
--   Ejemplo:                                                       --
--     ghci> balance [1,4,6,9                                       --
--     Node (Node (Leaf 1) (Leaf 4)) (Node (Leaf 6) (Leaf 9))       --
----------------------------------------------------------------------

splitList :: [a] -> ([a], [a])
splitList xs = splitAt (length xs `div` 2) xs

data Tree a = Leaf a | Node (Tree a) (Tree a) deriving (Show)

balance :: [a] -> Tree a
balance [] = error "Empty list"
balance [x] = Leaf x
balance xs = Node (balance left) (balance right)
  where
    (left, right) = splitList xs
