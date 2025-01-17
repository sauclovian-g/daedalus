 {-|
  Name: PHAR-ISO
  Description: This file contains a Daedalus description of a PHAR/ISO
  polyglot that composes the files generated from PHAR.ddl and ISO.ddl.
  Note that this does not include the Phar signature, which must be
  generated and appended as a post-processing step.

  Maintainer     : Cole Schlesinger <coles@galois.com>
  Stability      : provisional
-}

import PHAR
import ISO

def Main =
  block
    Prefix
    Suffix

def Prefix = ISOContents
def Suffix = PHARContents
