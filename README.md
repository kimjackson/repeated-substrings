# repeated-substrings

If you have ghc installed you can do something like:
`$ echo "aaa" | runghc RepeatedSubstrings.hs`

The file `RepeatedSubstrings` is a binary, compiled for MacOS, so if you've got one of those you can do:
`echo "abca" | ./RepeatedSubstrings`

Try:
`ghc --make RepeatedSubstrings.hs -Wall -O2 -prof -fprof-auto`
`time for f in full_test_data/input*; do cat $f | ./RepeatedSubstrings; done`
