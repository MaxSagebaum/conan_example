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
      # echo cmake . -B build_${val}_${func}_${conf} -DCMAKE_PREFIX_PATH=$(pwd)/conan_deps -DCMAKE_BUILD_TYPE=$conf -DFUNCTION_TYPE=$func -DVALUE_TYPE=$val
      # cmake . -B build_${val}_${func}_${conf} -DCMAKE_PREFIX_PATH=$(pwd)/conan_deps -DCMAKE_BUILD_TYPE=$conf -DFUNCTION_TYPE=$func -DVALUE_TYPE=$val
      conan build . -s "&:build_type=$conf" -s build_type=Release -o func=$func -o val=$val
    done
  done
done
