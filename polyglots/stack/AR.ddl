{-|
  Name: AR
  Description: This file contains a Daedalus description of the contents of
  a AR file for Talos to generate.  Use `Match [...]` to force Talos to
  produce a specific AR file.
  Maintainer     : Cole Schlesinger <coles@galois.com>
  Stability      : provisional
-}

def ARContents = Match [
 0x21, 0x3c, 0x61, 0x72, 0x63, 0x68, 0x3e, 0x0a,  0x72, 0x65, 0x61, 0x64, 0x6d, 0x65, 0x2f, 0x20,
 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20,  0x30, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20,
 0x20, 0x20, 0x20, 0x20, 0x30, 0x20, 0x20, 0x20,  0x20, 0x20, 0x30, 0x20, 0x20, 0x20, 0x20, 0x20,
 0x30, 0x30, 0x30, 0x20, 0x20, 0x20, 0x20, 0x20,  0x39, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20,
 0x20, 0x20, 0x60, 0x0a, 0x61, 0x72, 0x63, 0x68,  0x69, 0x76, 0x65, 0x00, 0x0a, 0x0a,  
]
