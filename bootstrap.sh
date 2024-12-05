#!/bin/bash

VALUES="VALUE1 VALUE2 VALUE3 VALUE4"
FUNCTIONS="FUNC1 FUNC2 FUNC3 FUNC4"
BUILDS="Debug Release"

for val in $VALUES
do
  for func in $FUNCTIONS
  do
    for conf in $BUILDS
    do
      echo cmake . -B build_${val}_${func}_${conf} -DCMAKE_TOOLCHAIN_FILE=conan_deps/$conf/conan_toolchain.cmake -DCMAKE_BUILD_TYPE=$conf -DFUNCTION_TYPE=$func -DVALUE_TYPE=$val
      cmake . -B build_${val}_${func}_${conf} -DCMAKE_TOOLCHAIN_FILE=conan_deps/$conf/conan_toolchain.cmake -DCMAKE_BUILD_TYPE=$conf -DFUNCTION_TYPE=$func -DVALUE_TYPE=$val
    done
  done
done
