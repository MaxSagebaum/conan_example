cmake_minimum_required(VERSION 3.15)
project(example)

find_package(MPI REQUIRED)

set(FUNCTION_TYPE "FUNC1" CACHE STRING "Function")
set_property(CACHE FUNCTION_TYPE PROPERTY STRINGS "FUNC1" "FUNC2" "FUNC3" "FUNC4")

set(VALUE_TYPE "VALUE1" CACHE STRING "Value")
set_property(CACHE VALUE_TYPE PROPERTY STRINGS "VALUE1" "VALUE2" "VALUE3" "VALUE4")

add_executable(${PROJECT_NAME} src/main.cpp)
target_link_libraries(${PROJECT_NAME} openmpi::openmpi)
#target_link_libraries(${PROJECT_NAME} PUBLIC MPI::MPI_CXX)

target_compile_definitions(${PROJECT_NAME} PUBLIC FUNCTION_TYPE=${FUNCTION_TYPE})
target_compile_definitions(${PROJECT_NAME} PUBLIC VALUE_TYPE=${VALUE_TYPE})

