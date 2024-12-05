#!/bin/bash

conan install . --output-folder=conan_deps/Release -s build_type=Release -s "&:build_type=Release" --build=missing
conan install . --output-folder=conan_deps/Debug   -s build_type=Release -s "&:build_type=Debug"   --build=missing
