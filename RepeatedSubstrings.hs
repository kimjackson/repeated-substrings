main = do
    input <- getLine
    print (repeatedsubstrings input)

repeatedsubstrings :: String -> Int
repeatedsubstrings s  = sum [ checkpartitions s i | i <- [1..((length s)-1) `div` 2] ]

checkpartitions :: String -> Int -> Int
--                      YYW             YWY             WYY
checkpartitions s i  = (match y1 y2) + (match y1 y4) + (match y3 y4)
    where y1 = take i s                 -- 0..i       first i chars
          y2 = take i $ drop i s        -- i..2i      next i chars
          y3 = take i $ drop (l-2*i) s  -- l-2i..l-i  next to last i chars
          y4 = drop (l-i) s             -- l-i..l     last i chars
          l  = length s

match :: String -> String -> Int
match x y | x == y    = 1
          | otherwise = 0
