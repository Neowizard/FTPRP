cmake_minimum_required(VERSION 3.2)
project(ft_prp)

set(EXECUTABLE_OUTPUT_PATH ${CMAKE_CURRENT_SOURCE_DIR}/)

set(CMAKE_RUNTIME_OUTPUT_DIRECTORY )
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -g -Wno-deprecated -DHK_DBG -O0")
add_definitions(-DFTD)

subdirs(PRP/src)

include_directories(PRP/src/search)
