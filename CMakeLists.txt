cmake_minimum_required(VERSION 3.10)
project(translator)

set(CMAKE_CXX_STANDARD 17)
set(SOURCE_FILES main.cpp CPU.cpp assembler.cpp semantic_function.cpp
        semantic_function.h binary-translator.h binary-translator.cpp
        semantic_function_2.cpp semantic_function_2.h generated.s)
add_executable(translator ${SOURCE_FILES})
enable_language(ASM)