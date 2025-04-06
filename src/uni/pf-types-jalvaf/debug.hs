test :: IO ()
test = do
    a <- getLine
    b <- getLine
    print $ a ++ b