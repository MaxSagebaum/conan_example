#include <mpi.h>

#include <iostream>

#ifndef FUNCTION_TYPE
#error Specify a function type
#endif

#ifndef VALUE_TYPE
#error Specify a value type
#endif

using VALUE1 = int;
using VALUE2 = double;
using VALUE3 = float;
using VALUE4 = long;

using Value = VALUE_TYPE;


Value FUNC1(Value x, Value y) { return x + y; }
Value FUNC2(Value x, Value y) { return x - y; }
Value FUNC3(Value x, Value y) { return x * y; }
Value FUNC4(Value x, Value y) { return x / y; }

int main(int nargs, char** args) {
  MPI_Init(&nargs, &args);

  int world_size;
  MPI_Comm_size(MPI_COMM_WORLD, &world_size);

  int world_rank;
  MPI_Comm_rank(MPI_COMM_WORLD, &world_rank);

  std::cout << "Result: " << FUNCTION_TYPE((Value)world_rank, (Value)world_size) << std::endl;

  MPI_Finalize();

  return 0;
}
