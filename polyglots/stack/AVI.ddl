{-|
  Name: AVI
  Description: This file contains a Daedalus description of the contents of
  a AVI file for Talos to generate.  Use `Match [...]` to force Talos to
  produce a specific AVI file.
  Maintainer     : Cole Schlesinger <coles@galois.com>
  Stability      : provisional
-}

def AVIContents = Match [
 0x52, 0x49, 0x46, 0x46, 0x9e, 0x16, 0x00, 0x00,  0x41, 0x56, 0x49, 0x20, 0x4c, 0x49, 0x53, 0x54,
 0xf0, 0x11, 0x00, 0x00, 0x68, 0x64, 0x72, 0x6c,  0x61, 0x76, 0x69, 0x68, 0x38, 0x00, 0x00, 0x00,
 0x40, 0x9c, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  0x00, 0x00, 0x00, 0x00, 0x10, 0x09, 0x00, 0x00,
 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x10, 0x00,
 0x0d, 0x00, 0x00, 0x00, 0x07, 0x00, 0x00, 0x00,  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  0x4c, 0x49, 0x53, 0x54, 0x98, 0x10, 0x00, 0x00,
 0x73, 0x74, 0x72, 0x6c, 0x73, 0x74, 0x72, 0x68,  0x38, 0x00, 0x00, 0x00, 0x76, 0x69, 0x64, 0x73,
 0x4d, 0x50, 0x4e, 0x47, 0x00, 0x00, 0x00, 0x00,  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
 0x01, 0x00, 0x00, 0x00, 0x19, 0x00, 0x00, 0x00,  0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00,
 0x54, 0x00, 0x00, 0x00, 0xff, 0xff, 0xff, 0xff,  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
 0x0d, 0x00, 0x07, 0x00, 0x73, 0x74, 0x72, 0x66,  0x2c, 0x00, 0x00, 0x00, 0x28, 0x00, 0x00, 0x00,
 0x0d, 0x00, 0x00, 0x00, 0x07, 0x00, 0x00, 0x00,  0x01, 0x00, 0x18, 0x00, 0x4d, 0x50, 0x4e, 0x47,
 0x11, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00,
 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  0x4a, 0x55, 0x4e, 0x4b, 0x18, 0x10, 0x00, 0x00,
 0x04, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  0x30, 0x30, 0x64, 0x63, 0x00, 0x00, 0x00, 0x00,
 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  0x4a, 0x55, 0x4e, 0x4b, 0x04, 0x01, 0x00, 0x00,
 0x6f, 0x64, 0x6d, 0x6c, 0x64, 0x6d, 0x6c, 0x68,  0xf8, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
 0x00, 0x00, 0x00, 0x00, 0x4c, 0x49, 0x53, 0x54,  0x1a, 0x00, 0x00, 0x00, 0x49, 0x4e, 0x46, 0x4f,
 0x49, 0x53, 0x46, 0x54, 0x0e, 0x00, 0x00, 0x00,  0x4c, 0x61, 0x76, 0x66, 0x35, 0x37, 0x2e, 0x34,
 0x31, 0x2e, 0x31, 0x30, 0x30, 0x00, 0x4a, 0x55,  0x4e, 0x4b, 0xf8, 0x03, 0x00, 0x00, 0x00, 0x00,
 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x4c, 0x49,  0x53, 0x54, 0x60, 0x00, 0x00, 0x00, 0x6d, 0x6f,
 0x76, 0x69, 0x30, 0x30, 0x64, 0x63, 0x54, 0x00,  0x00, 0x00, 0x89, 0x50, 0x4e, 0x47, 0x0d, 0x0a,
 0x1a, 0x0a, 0x00, 0x00, 0x00, 0x0d, 0x49, 0x48,  0x44, 0x52, 0x00, 0x00, 0x00, 0x0d, 0x00, 0x00,
 0x00, 0x07, 0x01, 0x00, 0x00, 0x00, 0x00, 0xfb,  0x0b, 0xfa, 0xb7, 0x00, 0x00, 0x00, 0x1b, 0x49,
 0x44, 0x41, 0x54, 0x78, 0x01, 0x63, 0xf8, 0xff,  0x83, 0xe1, 0x56, 0x07, 0xc3, 0xaa, 0x1b, 0x0c,
 0x5d, 0x37, 0x18, 0xd6, 0x02, 0x51, 0x07, 0x50,  0x04, 0x00, 0x73, 0xcc, 0x0a, 0xef, 0x76, 0x38,
 0xa7, 0x09, 0x00, 0x00, 0x00, 0x00, 0x49, 0x45,  0x4e, 0x44, 0xae, 0x42, 0x60, 0x82, 0x69, 0x64,
 0x78, 0x31, 0x10, 0x00, 0x00, 0x00, 0x30, 0x30,  0x64, 0x63, 0x10, 0x00, 0x00, 0x00, 0x04, 0x00,
 0x00, 0x00, 0x54, 0x00, 0x00, 0x00,           
]
