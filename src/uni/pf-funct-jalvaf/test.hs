import Test.HUnit

double :: Int -> Int
double x = x + x

testDouble :: Test
testDouble = test [
    "positive param" ~: double 2 ~?= 4,
    "negative param" ~: double (-1) ~?= (-2)
  ]

testPositive = TestCase (assertEqual "double 2, " 4 (double 2))
testNegative = TestCase (assertEqual "double (-1), " (-2) (double (-1)))

testListDouble = TestList [TestLabel "testPositive" testPositive, TestLabel "testNegative" testNegative]