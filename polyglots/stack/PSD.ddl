{-|
  Name: PSD
  Description: This file contains a Daedalus description of the contents of
  a PSD file for Talos to generate.  Use `Match [...]` to force Talos to
  produce a specific PSD file.
  Maintainer     : Cole Schlesinger <coles@galois.com>
  Stability      : provisional
-}

def PSDContents = Match [
0x38, 0x42, 0x50, 0x53, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00,
0x00, 0x07, 0x00, 0x00, 0x00, 0x25, 0x00, 0x08, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
0x00, 0x2a, 0x38, 0x42, 0x49, 0x4d, 0x03, 0xed, 0x00, 0x00, 0x00, 0x00, 0x00, 0x10, 0x01, 0x2c,
0x00, 0x00, 0x00, 0x01, 0x00, 0x01, 0x01, 0x2c, 0x00, 0x00, 0x00, 0x01, 0x00, 0x01, 0x38, 0x42,
0x49, 0x4d, 0x04, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x01, 0x25,
0x00, 0x00, 0x01, 0x21, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
0x00, 0x07, 0x00, 0x00, 0x00, 0x25, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0xc7, 0x38, 0x42,
0x49, 0x4d, 0x6e, 0x6f, 0x72, 0x6d, 0xff, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x30, 0x00, 0x00,
0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x38, 0x42, 0x49, 0x4d, 0x6c, 0x75,
0x6e, 0x69, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00, 0x00, 0x38, 0x42, 0x49, 0x4d, 0x6c, 0x63,
0x6c, 0x72, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01,
0x00, 0x02, 0x00, 0x14, 0x00, 0x26, 0x00, 0x27, 0x00, 0x27, 0x00, 0x27, 0x00, 0x06, 0xdc, 0xff,
0x05, 0xff, 0x00, 0x00, 0xff, 0xff, 0x00, 0xf9, 0xff, 0x00, 0x00, 0xfa, 0xff, 0xff, 0x00, 0x01,
0xff, 0x00, 0xf6, 0xff, 0x06, 0xff, 0x00, 0xff, 0x00, 0xff, 0x00, 0x00, 0xfe, 0xff, 0x02, 0x00,
0xff, 0xff, 0xfe, 0x00, 0xff, 0xff, 0x03, 0x00, 0xff, 0xff, 0x00, 0xfe, 0xff, 0xff, 0x00, 0xfe,
0xff, 0x05, 0x00, 0xff, 0xff, 0x00, 0x00, 0xff, 0x00, 0xff, 0x23, 0xff, 0x00, 0x00, 0xff, 0xff,
0x00, 0xff, 0x00, 0xff, 0x00, 0xff, 0x00, 0xff, 0xff, 0x00, 0xff, 0xff, 0x00, 0xff, 0x00, 0xff,
0xff, 0x00, 0xff, 0xff, 0x00, 0xff, 0x00, 0xff, 0x00, 0xff, 0x00, 0xff, 0x00, 0xff, 0x00, 0x00,
0xff, 0x01, 0xff, 0x00, 0xfe, 0xff, 0x0e, 0x00, 0xff, 0x00, 0xff, 0x00, 0xff, 0x00, 0xff, 0xff,
0x00, 0xff, 0xff, 0x00, 0xff, 0x00, 0xfe, 0xff, 0x0c, 0x00, 0xff, 0x00, 0xff, 0x00, 0xff, 0x00,
0xff, 0x00, 0xff, 0x00, 0xff, 0x00, 0x00, 0xff, 0x01, 0xff, 0x00, 0xfe, 0xff, 0x05, 0x00, 0xff,
0x00, 0xff, 0xff, 0x00, 0xfe, 0xff, 0xff, 0x00, 0xff, 0xff, 0x11, 0x00, 0xff, 0xff, 0x00, 0x00,
0xff, 0xff, 0x00, 0xff, 0x00, 0xff, 0xff, 0x00, 0xff, 0xff, 0x00, 0x00, 0xff, 0x00, 0xff, 0xe0,
0xff, 0x00, 0x00, 0xfe, 0xff, 0x00, 0x01, 0x00, 0x02, 0x00, 0x14, 0x00, 0x26, 0x00, 0x27, 0x00,
0x27, 0x00, 0x27, 0x00, 0x06, 0xdc, 0xff, 0x05, 0xff, 0x00, 0x00, 0xff, 0xff, 0x00, 0xf9, 0xff,
0x00, 0x00, 0xfa, 0xff, 0xff, 0x00, 0x01, 0xff, 0x00, 0xf6, 0xff, 0x06, 0xff, 0x00, 0xff, 0x00,
0xff, 0x00, 0x00, 0xfe, 0xff, 0x02, 0x00, 0xff, 0xff, 0xfe, 0x00, 0xff, 0xff, 0x03, 0x00, 0xff,
0xff, 0x00, 0xfe, 0xff, 0xff, 0x00, 0xfe, 0xff, 0x05, 0x00, 0xff, 0xff, 0x00, 0x00, 0xff, 0x00,
0xff, 0x23, 0xff, 0x00, 0x00, 0xff, 0xff, 0x00, 0xff, 0x00, 0xff, 0x00, 0xff, 0x00, 0xff, 0xff,
0x00, 0xff, 0xff, 0x00, 0xff, 0x00, 0xff, 0xff, 0x00, 0xff, 0xff, 0x00, 0xff, 0x00, 0xff, 0x00,
0xff, 0x00, 0xff, 0x00, 0xff, 0x00, 0x00, 0xff, 0x01, 0xff, 0x00, 0xfe, 0xff, 0x0e, 0x00, 0xff,
0x00, 0xff, 0x00, 0xff, 0x00, 0xff, 0xff, 0x00, 0xff, 0xff, 0x00, 0xff, 0x00, 0xfe, 0xff, 0x0c,
0x00, 0xff, 0x00, 0xff, 0x00, 0xff, 0x00, 0xff, 0x00, 0xff, 0x00, 0xff, 0x00, 0x00, 0xff, 0x01,
0xff, 0x00, 0xfe, 0xff, 0x05, 0x00, 0xff, 0x00, 0xff, 0xff, 0x00, 0xfe, 0xff, 0xff, 0x00, 0xff,
0xff, 0x11, 0x00, 0xff, 0xff, 0x00, 0x00, 0xff, 0xff, 0x00, 0xff, 0x00, 0xff, 0xff, 0x00, 0xff,
0xff, 0x00, 0x00, 0xff, 0x00, 0xff, 0xe0, 0xff, 0x00, 0x00, 0xfe, 0xff,    
]
