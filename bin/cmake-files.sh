projName=$1



cd $projName
echo "
#!/bin/sh
cd build
cmake ..
#rm -r CMakeFiles/
#rm cmake_install.cmake
#rm CMakeCache.txt
" > build.sh

echo "
#!/bin/sh
cd build
make
#rm -r CMakeFiles/
#rm cmake_install.cmake
#rm CMakeCache.txt
echo  to run the project
echo  cd ..
echo  cd build
echo  ./$projName
" > compile.sh


echo "
cmake_minimum_required (VERSION 3.5)

project ($projName VERSION 1.0.0)
add_subdirectory(libs)

include_directories(${PROJECT_SOURCE_DIR}/include)

set (CMAKE_CXX_FLAGS \"\${CMAKE_CXX_FLAGS} -Wall -Werror -std=c++14\")
set (source_dir \"\${PROJECT_SOURCE_DIR}/src/\")

file (GLOB source_files \"\${source_dir}/*.cpp\")

add_executable ($projName \${source_files})
" > CMakeLists.txt





cd Include
echo "" >> CMakeLists.txt
cd ..