import Test.HUnit
qsort [] = []
qsort (a:as) = qsort left ++ [a] ++ qsort right
  where (left,right) = (filter (<=a) as, filter (>a) as)

testQsort :: Test
testQsort = test [
    "Empty list" ~: qsort ([] :: [Int]) ~?= ([] :: [Int]),
    "Sorted list" ~: qsort [1,2,3,4,5] ~?= [1,2,3,4,5],
    "Reverse sorted list" ~: qsort [5,4,3,2,1] ~?= [1,2,3,4,5],
    "Unsorted list" ~: qsort [3,1,4,1,5,9,2,6,5,3,5] ~?= [1,1,2,3,3,4,5,5,5,6,9]
  ]