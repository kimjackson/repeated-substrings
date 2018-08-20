import qualified Data.ByteString as B

main = do
    input <- B.getLine
    print (repeatedsubstrings input)

repeatedsubstrings :: B.ByteString -> Int
repeatedsubstrings s  = sum [ checkpartitions s i | i <- [1..((B.length s)-1) `div` 2] ]

checkpartitions :: B.ByteString -> Int -> Int
--                      YYW             YWY             WYY
checkpartitions s i  = (match y1 y2) + (match y1 y4) + (match y3 y4)
    where y1 = B.take i s                   -- 0..i       first i chars
          y2 = B.take i $ B.drop i s        -- i..2i      next i chars
          y3 = B.take i $ B.drop (l-2*i) s  -- l-2i..l-i  next to last i chars
          y4 = B.drop (l-i) s               -- l-i..l     last i chars
          l  = B.length s

match :: B.ByteString -> B.ByteString -> Int
match x y | x == y    = 1
          | otherwise = 0
