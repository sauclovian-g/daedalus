{-|
  Name: SWF
  Description: This file contains a Daedalus description of the contents of
  a SWF file for Talos to generate.  Use `Match [...]` to force Talos to
  produce a specific SWF file.
  Maintainer     : Cole Schlesinger <coles@galois.com>
  Stability      : provisional
-}

def SWFContents = Match [
 0x46, 0x57, 0x53, 0x07, 0x8c, 0x00, 0x00, 0x00,  0x78, 0x00, 0x05, 0x5f, 0x00, 0x00, 0x0f, 0xa0,
 0x00, 0x00, 0x0c, 0x01, 0x00, 0x3f, 0x03, 0x6d,  0x00, 0x00, 0x00, 0x88, 0x2c, 0x00, 0x04, 0x00,
 0x6d, 0x65, 0x73, 0x73, 0x61, 0x67, 0x65, 0x00,  0x63, 0x72, 0x65, 0x61, 0x74, 0x65, 0x54, 0x65,
 0x78, 0x74, 0x46, 0x69, 0x65, 0x6c, 0x64, 0x00,  0x74, 0x65, 0x78, 0x74, 0x00, 0x48, 0x65, 0x6c,
 0x6c, 0x6f, 0x20, 0x57, 0x6f, 0x72, 0x6c, 0x64,  0x21, 0x00, 0x96, 0x2a, 0x00, 0x07, 0x32, 0x00,
 0x00, 0x00, 0x07, 0x64, 0x00, 0x00, 0x00, 0x06,  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
 0x06, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  0x00, 0x07, 0x01, 0x00, 0x00, 0x00, 0x08, 0x00,
 0x07, 0x06, 0x00, 0x00, 0x00, 0x08, 0x01, 0x3d,  0x17, 0x96, 0x02, 0x00, 0x08, 0x00, 0x1c, 0x96,
 0x04, 0x00, 0x08, 0x02, 0x08, 0x03, 0x4f, 0x00,  0x40, 0x00, 0x00, 0x00,    
]
