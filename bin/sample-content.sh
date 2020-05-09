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
echo  cd build
echo  ./$projName
" > compile.sh


echo "
cmake_minimum_required (VERSION 3.5)

project ($projName)
add_subdirectory(Include)
set (CMAKE_CXX_FLAGS \"\${CMAKE_CXX_FLAGS} -Wall -Werror -std=c++14\")
set (source_dir \"\${PROJECT_SOURCE_DIR}/src/\")

file (GLOB source_files \"\${source_dir}/*.cpp\")

add_executable ($projName \${source_files})
" > CMakeLists.txt

cd scripts
echo "
#!/bin/sh
cd ..
rm -r build/
mkdir build
./build.sh
./compile.sh
" > start.sh

echo "
libName=\$1
cd ..
echo \"
target_link_libraries($projName PRIVATE \$libName)
\" >> CMakeLists.txt

cd Include
echo \"
add_library(
	\$libName
	\$libName/\$libName.cpp
)

target_include_directories(\$libName PUBLIC "\"\\$\{CMAKE_CURRENT_SOURCE_DIR\}/"\")
\" >> CMakeLists.txt

" > add-libaray-static.sh



echo "
libName=\$1
cd ..
echo \"
target_link_libraries($projName PRIVATE \$libName)
\" >> CMakeLists.txt

" > import-lib-dynamic.sh


cd ..

cd src
echo "
#include<iostream>
int main()
{
    std::cout << \"hi there\" << std::endl;
    return 0;    
}
" > Main.cpp

cd ..
cd Include
echo "" >> CMakeLists.txt
cd ..