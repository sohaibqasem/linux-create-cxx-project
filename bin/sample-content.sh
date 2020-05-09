projName=$1



cd $projName
echo "
#!/bin/sh

cmake .
rm -r CMakeFiles/
rm cmake_install.cmake
rm CMakeCache.txt
" > build.sh

echo "
#!/bin/sh

make
rm -r CMakeFiles/
rm cmake_install.cmake
rm CMakeCache.txt
echo  to run the project
echo  ./$projName
" > compile.sh


echo "
cmake_minimum_required (VERSION 3.5)

project ($projName)

set (CMAKE_CXX_FLAGS \"\${CMAKE_CXX_FLAGS} -Wall -Werror -std=c++14\")
set (source_dir \"\${PROJECT_SOURCE_DIR}/src/\")

file (GLOB source_files \"\${source_dir}/*.cpp\")

add_executable ($projName \${source_files})
" > CMakeLists.txt

cd src
echo "
#include<iostream>
int main()
{
    std::cout << \"hi there\" << std::endl;
    return 0;    
}
" > Main.cpp
