projName=$1

cd $projName-workSpace/$projName


echo "
cmake_minimum_required (VERSION 3.5)

project ($projName VERSION 1.0.0)
link_directories(libs)

include_directories(\${PROJECT_SOURCE_DIR}/include)

set (CMAKE_CXX_FLAGS \"\${CMAKE_CXX_FLAGS} -Wall -Werror -std=c++14\")
set (source_dir \"\${PROJECT_SOURCE_DIR}/src/\")

file (GLOB_RECURSE source_files \"\${source_dir}/*.cpp\")

add_executable ($projName \${source_files})

MACRO(LIBLIST result curlib)
  FILE(GLOB_RECURSE children RELATIVE \${curlib} \${curlib}/*)
  SET(liblist "")
  FOREACH(child \${children})
    
      LIST(APPEND liblist \${child})
    
  ENDFOREACH()
  SET(\${result} \${liblist})
ENDMACRO()

LIBLIST(LIBS \${PROJECT_SOURCE_DIR}/libs)

FOREACH(LIB \${LIBS})
  message(STATUS \${LIB})
  target_link_libraries($projName PRIVATE \${LIB})
ENDFOREACH()

" > CMakeLists.txt