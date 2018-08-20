main = do
    input <- getLine
    print (repeatedsubstrings input)

repeatedsubstrings :: String -> Int
repeatedsubstrings s  = do
    let l = length s
    let m = (l-1) `div` 2
    sum [ checkpartitions s l i | i <- [1..m] ]

checkpartitions :: String -> Int -> Int -> Int
checkpartitions s l i  = (match s l i 0 0 i)           -- YYW
                       + (match s l i 0 0 (l-i))       -- YWY
                       + (match s l i 0 (l-2*i) (l-i)) -- WYY
-- 0..i       first i chars
-- i..2i      next i chars
-- l-2i..l-i  next to last i chars
-- l-i..l     last i chars

match :: String -> Int -> Int-> Int -> Int -> Int -> Int
match s l i j y1 y2 | j == i                 = 1
                    | s!!(y1+j) /= s!!(y2+j) = 0
                    | otherwise              = match s l i y1 y2 (j+1)
