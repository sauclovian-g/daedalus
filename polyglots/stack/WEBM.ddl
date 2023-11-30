{-|
  Name: WEBM
  Description: This file contains a Daedalus description of the contents of
  a WEBM file for Talos to generate.  Use `Match [...]` to force Talos to
  produce a specific WEBM file.
  Maintainer     : Cole Schlesinger <coles@galois.com>
  Stability      : provisional
-}

def WEBMContents = Match [
0x1a, 0x45, 0xdf, 0xa3, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x1f, 0x42, 0x86, 0x81, 0x01,
0x42, 0xf7, 0x81, 0x01, 0x42, 0xf2, 0x81, 0x04, 0x42, 0xf3, 0x81, 0x08, 0x42, 0x82, 0x84, 0x77,
0x65, 0x62, 0x6d, 0x42, 0x87, 0x81, 0x02, 0x42, 0x85, 0x81, 0x02, 0x18, 0x53, 0x80, 0x67, 0x01,
0x00, 0x00, 0x00, 0x00, 0x00, 0x05, 0x94, 0x11, 0x4d, 0x9b, 0x74, 0x40, 0x2c, 0x4d, 0xbb, 0x8b,
0x53, 0xab, 0x84, 0x15, 0x49, 0xa9, 0x66, 0x53, 0xac, 0x81, 0xdf, 0x4d, 0xbb, 0x8c, 0x53, 0xab,
0x84, 0x16, 0x54, 0xae, 0x6b, 0x53, 0xac, 0x82, 0x01, 0x30, 0x4d, 0xbb, 0x8c, 0x53, 0xab, 0x84,
0x1c, 0x53, 0xbb, 0x6b, 0x53, 0xac, 0x82, 0x05, 0x77, 0xec, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00,
0x00, 0xa4, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x15, 0x49, 0xa9, 0x66, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00,
0x00, 0x45, 0x2a, 0xd7, 0xb1, 0x83, 0x0f, 0x42, 0x40, 0x4d, 0x80, 0x8d, 0x4c, 0x61, 0x76, 0x66,
0x35, 0x37, 0x2e, 0x34, 0x31, 0x2e, 0x31, 0x30, 0x30, 0x57, 0x41, 0x8d, 0x4c, 0x61, 0x76, 0x66,
0x35, 0x37, 0x2e, 0x34, 0x31, 0x2e, 0x31, 0x30, 0x30, 0x73, 0xa4, 0x90, 0x4a, 0x9b, 0x1b, 0xd7,
0x98, 0x0a, 0xbd, 0xa8, 0xc8, 0x37, 0x18, 0xf1, 0x20, 0x59, 0xa1, 0xb4, 0x44, 0x89, 0x88, 0x40,
0x8f, 0x40, 0x00, 0x00, 0x00, 0x00, 0x00, 0x16, 0x54, 0xae, 0x6b, 0x01, 0x00, 0x00, 0x00, 0x00,
0x00, 0x00, 0x43, 0xae, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x3a, 0xd7, 0x81, 0x01, 0x73,
0xc5, 0x81, 0x01, 0x9c, 0x81, 0x00, 0x22, 0xb5, 0x9c, 0x83, 0x75, 0x6e, 0x64, 0x86, 0x85, 0x56,
0x5f, 0x56, 0x50, 0x39, 0x83, 0x81, 0x01, 0x23, 0xe3, 0x83, 0x84, 0x02, 0x62, 0x5a, 0x00, 0xe0,
0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x0e, 0xb0, 0x81, 0x11, 0xba, 0x81, 0x07, 0x54, 0xb0,
0x81, 0x11, 0x54, 0xba, 0x81, 0x07, 0x1f, 0x43, 0xb6, 0x75, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00,
0x03, 0xec, 0xe7, 0x81, 0x00, 0xa3, 0x41, 0xac, 0x81, 0x00, 0x00, 0x80, 0xa2, 0x49, 0x83, 0x42,
0xe0, 0x01, 0x00, 0x00, 0x66, 0x08, 0x38, 0x24, 0x1c, 0x18, 0x54, 0x00, 0x00, 0x20, 0x20, 0x00,
0x1b, 0xd7, 0xff, 0xff, 0xf8, 0x7b, 0xec, 0x3f, 0xba, 0x99, 0x6f, 0xcf, 0x05, 0x7f, 0xec, 0x8f,
0xc1, 0x12, 0xd5, 0x3b, 0xfc, 0x73, 0xff, 0xe2, 0xec, 0xf0, 0x7c, 0x36, 0xc6, 0xa1, 0xea, 0x13,
0xe7, 0x9d, 0xff, 0xe7, 0xe5, 0x9f, 0x86, 0x41, 0x1a, 0x90, 0x76, 0x8f, 0xdb, 0x29, 0xfb, 0x94,
0x59, 0xd3, 0xc7, 0x06, 0x43, 0xfc, 0xff, 0xff, 0x5e, 0x4e, 0x7a, 0x53, 0x44, 0x1d, 0x74, 0x39,
0x26, 0xd3, 0x3f, 0x90, 0x36, 0x56, 0x7e, 0x29, 0x42, 0x21, 0x92, 0xb2, 0x7f, 0x2f, 0x36, 0x97,
0x32, 0x04, 0x13, 0xf3, 0xd8, 0x33, 0x97, 0xde, 0x80, 0xdb, 0xd5, 0xb9, 0x4f, 0x4d, 0x3f, 0xf3,
0xc5, 0x8e, 0x55, 0x78, 0x0f, 0xc9, 0x8d, 0xdd, 0x95, 0xac, 0xc1, 0x5a, 0x82, 0x30, 0xff, 0x67,
0x7d, 0x7e, 0x7d, 0xfc, 0x7e, 0x20, 0xc5, 0x0e, 0xd3, 0xf2, 0xfe, 0xaa, 0x44, 0xd7, 0x73, 0x7f,
0xff, 0xff, 0xf8, 0x9e, 0x22, 0xbf, 0x97, 0x3a, 0x21, 0xec, 0xfa, 0xaf, 0xff, 0xac, 0xf4, 0x9a,
0xc6, 0x14, 0x7e, 0x1e, 0x6d, 0xff, 0xff, 0x1b, 0x4f, 0x9c, 0x6c, 0x31, 0x59, 0xa7, 0xb6, 0xd0,
0x1e, 0x62, 0xbf, 0xa5, 0x09, 0xce, 0xca, 0xfc, 0x3e, 0x2e, 0x6a, 0xb8, 0x89, 0x3f, 0xed, 0x8b,
0xe1, 0x76, 0xf5, 0x8b, 0x01, 0x78, 0x80, 0xff, 0xd7, 0xa4, 0x40, 0x5f, 0xf6, 0x99, 0xcd, 0x9c,
0x5e, 0xc6, 0x8f, 0xff, 0xfa, 0xeb, 0x8e, 0x67, 0xeb, 0xe3, 0x0f, 0xeb, 0x9c, 0x0e, 0x06, 0x70,
0xa1, 0x4b, 0x21, 0x76, 0x86, 0xdb, 0xef, 0xc1, 0xb3, 0xac, 0x61, 0x78, 0x7a, 0x6d, 0x1a, 0x39,
0x7b, 0xaa, 0xfe, 0x3f, 0x37, 0x3b, 0xf8, 0xdd, 0x0d, 0x9c, 0x13, 0x7c, 0x1d, 0x9e, 0xac, 0x06,
0xb1, 0xf9, 0xfd, 0xb5, 0xe8, 0x81, 0xe9, 0x4b, 0x41, 0x2f, 0xe3, 0x11, 0x6d, 0xb4, 0xba, 0x47,
0xcb, 0xff, 0xff, 0xff, 0xe2, 0x78, 0x8a, 0xfe, 0x5c, 0xe8, 0x87, 0xb3, 0xea, 0xbf, 0xfe, 0xb3,
0xd2, 0x6b, 0x18, 0x51, 0xf8, 0x79, 0xb7, 0xff, 0xfc, 0x6d, 0x3e, 0x71, 0xb0, 0xc5, 0x66, 0x9e,
0xdb, 0x40, 0x79, 0x8a, 0xfe, 0x94, 0x27, 0x3b, 0x2b, 0xf0, 0xf8, 0xb9, 0xaa, 0xe2, 0x24, 0xff,
0xb6, 0x2f, 0x85, 0xdb, 0xd6, 0x2c, 0x05, 0xe2, 0x03, 0xff, 0x5e, 0x91, 0x01, 0x7f, 0xda, 0x67,
0x36, 0x71, 0x7b, 0x1a, 0x3f, 0xff, 0xeb, 0xae, 0x39, 0x9f, 0xaf, 0x8c, 0x3f, 0xae, 0x70, 0x38,
0x19, 0xc2, 0x85, 0x2c, 0x85, 0xda, 0x1b, 0x6f, 0xbf, 0x06, 0xce, 0xb1, 0x85, 0xe1, 0xe9, 0xb4,
0x68, 0xe5, 0xee, 0xab, 0xf8, 0xfc, 0xdc, 0xef, 0xe3, 0x74, 0x36, 0x70, 0x4d, 0xf0, 0x76, 0x7a,
0xb0, 0x1a, 0xc7, 0xe7, 0xf6, 0xd7, 0xa2, 0x07, 0xa5, 0x2d, 0x04, 0xbf, 0x8c, 0x45, 0xb6, 0xd2,
0xe9, 0x1f, 0x03, 0x3f, 0xff, 0xfb, 0x2a, 0x23, 0xff, 0xff, 0xff, 0xb2, 0xa2, 0x3f, 0xff, 0xff,
0xfb, 0x2a, 0x20, 0x00, 0xa3, 0xa9, 0x81, 0x00, 0x28, 0x00, 0xa4, 0x00, 0x80, 0x49, 0x4e, 0x80,
0x21, 0xb0, 0x00, 0x01, 0x80, 0x20, 0x00, 0x00, 0x65, 0x4c, 0x00, 0xa6, 0x00, 0x40, 0x96, 0x9c,
0x00, 0x4c, 0x40, 0x00, 0x03, 0x20, 0x00, 0x00, 0x33, 0xb9, 0x00, 0xc1, 0x11, 0x10, 0xc1, 0xa3,
0x94, 0x81, 0x00, 0x50, 0x00, 0xa6, 0x00, 0x40, 0x96, 0x9c, 0x00, 0x4d, 0xc0, 0x00, 0x03, 0x20,
0x00, 0x00, 0x65, 0x4c, 0x00, 0xa3, 0x94, 0x81, 0x00, 0x78, 0x00, 0xa6, 0x00, 0x40, 0x96, 0x9c,
0x00, 0x4d, 0x80, 0x00, 0x03, 0x20, 0x00, 0x00, 0x65, 0x4c, 0x00, 0xa3, 0x94, 0x81, 0x00, 0xa0,
0x00, 0xa6, 0x00, 0x40, 0x96, 0x9c, 0x00, 0x4d, 0x60, 0x00, 0x03, 0x20, 0x00, 0x00, 0x65, 0x4c,
0x00, 0xa3, 0x94, 0x81, 0x00, 0xc8, 0x00, 0xa6, 0x00, 0x40, 0x96, 0x9c, 0x00, 0x4d, 0x20, 0x00,
0x03, 0x20, 0x00, 0x00, 0x65, 0x4c, 0x00, 0xa3, 0x94, 0x81, 0x00, 0xf0, 0x00, 0xa6, 0x00, 0x40,
0x96, 0x9c, 0x00, 0x4c, 0xe0, 0x00, 0x03, 0x20, 0x00, 0x00, 0x65, 0x4c, 0x00, 0xa3, 0x94, 0x81,
0x01, 0x18, 0x00, 0xa6, 0x00, 0x40, 0x96, 0x9c, 0x00, 0x4c, 0xc0, 0x00, 0x03, 0x20, 0x00, 0x00,
0x65, 0x4c, 0x00, 0xa3, 0x94, 0x81, 0x01, 0x40, 0x00, 0xa6, 0x00, 0x40, 0x96, 0x9c, 0x00, 0x4c,
0x80, 0x00, 0x03, 0x20, 0x00, 0x00, 0x65, 0x4c, 0x00, 0xa3, 0x94, 0x81, 0x01, 0x68, 0x00, 0xa6,
0x00, 0x40, 0x96, 0x9c, 0x00, 0x4c, 0x40, 0x00, 0x03, 0x20, 0x00, 0x00, 0x65, 0x4c, 0x00, 0xa3,
0x94, 0x81, 0x01, 0x90, 0x00, 0xa6, 0x01, 0x00, 0x96, 0x9c, 0x00, 0x4c, 0x20, 0x00, 0x03, 0x20,
0x00, 0x00, 0x38, 0x97, 0x00, 0xa3, 0xa9, 0x81, 0x01, 0xb8, 0x00, 0xa4, 0x00, 0x40, 0x85, 0x4e,
0x80, 0x21, 0xb0, 0x00, 0x01, 0x80, 0x20, 0x00, 0x00, 0x65, 0x4c, 0x00, 0xa6, 0x00, 0x41, 0x0e,
0x9c, 0x00, 0x4b, 0xc0, 0x00, 0x03, 0x20, 0x00, 0x00, 0x65, 0x4c, 0x00, 0xc1, 0x11, 0x10, 0xc1,
0xa3, 0x94, 0x81, 0x01, 0xe0, 0x00, 0xa6, 0x00, 0x41, 0x0e, 0x9c, 0x00, 0x4b, 0x60, 0x00, 0x03,
0x20, 0x00, 0x00, 0x65, 0x4c, 0x00, 0xa3, 0x94, 0x81, 0x02, 0x08, 0x00, 0xa6, 0x00, 0x41, 0x0e,
0x9c, 0x00, 0x4b, 0x00, 0x00, 0x03, 0x20, 0x00, 0x00, 0x65, 0x4c, 0x00, 0xa3, 0x94, 0x81, 0x02,
0x30, 0x00, 0xa6, 0x00, 0x41, 0x0e, 0x9c, 0x00, 0x4a, 0x80, 0x00, 0x03, 0x20, 0x00, 0x00, 0x65,
0x4c, 0x00, 0xa3, 0x94, 0x81, 0x02, 0x58, 0x00, 0xa6, 0x00, 0x41, 0x0e, 0x9c, 0x00, 0x4a, 0x20,
0x00, 0x03, 0x20, 0x00, 0x00, 0x65, 0x4c, 0x00, 0xa3, 0x94, 0x81, 0x02, 0x80, 0x00, 0xa6, 0x00,
0x41, 0x0e, 0x9c, 0x00, 0x49, 0xc0, 0x00, 0x03, 0x20, 0x00, 0x00, 0x65, 0x4c, 0x00, 0xa3, 0x94,
0x81, 0x02, 0xa8, 0x00, 0xa6, 0x00, 0x41, 0x0e, 0x9c, 0x00, 0x49, 0x80, 0x00, 0x03, 0x20, 0x00,
0x00, 0x65, 0x4c, 0x00, 0xa3, 0x94, 0x81, 0x02, 0xd0, 0x00, 0xa6, 0x00, 0x41, 0x0e, 0x9c, 0x00,
0x49, 0x20, 0x00, 0x03, 0x20, 0x00, 0x00, 0x65, 0x4c, 0x00, 0xa3, 0x94, 0x81, 0x02, 0xf8, 0x00,
0xa6, 0x00, 0x41, 0x0e, 0x9c, 0x00, 0x48, 0xe0, 0x00, 0x03, 0x20, 0x00, 0x00, 0x65, 0x4c, 0x00,
0xa3, 0x94, 0x81, 0x03, 0x20, 0x00, 0xa6, 0x00, 0x81, 0x0e, 0x9c, 0x00, 0x48, 0xa0, 0x00, 0x03,
0x20, 0x00, 0x00, 0x38, 0x97, 0x00, 0xa3, 0x94, 0x81, 0x03, 0x48, 0x00, 0xa6, 0x00, 0x40, 0x96,
0x9c, 0x00, 0x48, 0x60, 0x00, 0x03, 0x20, 0x00, 0x00, 0x65, 0x4c, 0x00, 0xa3, 0x94, 0x81, 0x03,
0x70, 0x00, 0xa6, 0x00, 0x40, 0x96, 0x9c, 0x00, 0x48, 0x20, 0x00, 0x03, 0x20, 0x00, 0x00, 0x65,
0x4c, 0x00, 0xa3, 0x94, 0x81, 0x03, 0x98, 0x00, 0xa6, 0x00, 0x40, 0x96, 0x9c, 0x00, 0x48, 0x00,
0x00, 0x03, 0x20, 0x00, 0x00, 0x65, 0x4c, 0x00, 0xa3, 0x94, 0x81, 0x03, 0xc0, 0x00, 0xa6, 0x00,
0x40, 0x96, 0x9c, 0x00, 0x47, 0xc0, 0x00, 0x03, 0x20, 0x00, 0x00, 0x65, 0x4c, 0x00, 0x1c, 0x53,
0xbb, 0x6b, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x11, 0xbb, 0x8f, 0xb3, 0x81, 0x00, 0xb7,
0x8a, 0xf7, 0x81, 0x01, 0xf1, 0x82, 0x01, 0x7f, 0xf0, 0x81, 0x03,     
]