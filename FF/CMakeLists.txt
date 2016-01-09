cmake_minimum_required(VERSION 3.3)
project(FF)

set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=c++11")

set(SOURCE_FILES main.c
        memory.c
        output.c
        parse.c
        inst_pre.c
        inst_easy.c
        inst_hard.c
        inst_final.c
        orderings.c
        relax.c
        search.c)

add_executable(FF ${SOURCE_FILES})


