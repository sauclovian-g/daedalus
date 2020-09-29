#include <string.h>
#include <memory>
#include <gmpxx.h>
#include <unordered_map>

#include "ddl/parser.h"
#include "ddl/unit.h"
#include "ddl/number.h"
#include "ddl/closure.h"
#include "ddl/array.h"
#include "ddl/integer.h"


int main() {
  DDL::Input i;
  DDL::Parser<int> p(i);

  DDL::Array<DDL::UInt<8>> arr(3,"ABC");
  std::cout << arr << std::endl;

  DDL::Integer x("123");
  DDL::Integer y("124");
  std::cout << (x == y) << std::endl;
  return 0;
}
