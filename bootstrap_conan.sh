#!/bin/bash

# Default is release
conan install . --output-folder=conan_deps --build=missing
