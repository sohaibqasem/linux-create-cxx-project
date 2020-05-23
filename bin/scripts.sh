projName=$1

cd $projName-workSpace/$projName
cd scripts
echo "
#!/bin/sh
cd ..
cd build
cmake .. -DCMAKE_BUILD_TYPE=Debug
make
FILE=test1
if [ -f "$FILE" ]; then
    echo
    echo  Compilation Secessed
    echo
    echo  To run the exe
    echo  ../build/$projName
    echo
else 
    echo
    echo "Compilation failled"
    echo
fi
" > start.sh

echo "
#!/bin/sh
cd ..
rm -r build/
mkdir build
cd build
cmake .. -DCMAKE_BUILD_TYPE=Release
make
" > release.sh

echo "
#!/bin/sh
cd ..
rm -r build/
mkdir build
cd build
cmake .. -DCMAKE_BUILD_TYPE=Debug
" > rebuild.sh

echo "
#!/bin/sh
libName=\$1
projName=\$2
cd ../..
mkdir \$libName
cd \$libName
mkdir include
mkdir src
mkdir build
touch CMakeLists.txt
touch build.sh
chmod +x build.sh

echo \"
cmake_minimum_required (VERSION 3.5)

project (\$libName VERSION 1.0.0)

include_directories(\\\${PROJECT_SOURCE_DIR}/include/)

set (CMAKE_CXX_FLAGS \\\"\\\${CMAKE_CXX_FLAGS} -Wall -std=c++14\\\")
set (source_dir \"\\\${PROJECT_SOURCE_DIR}/src/\")

file (GLOB_RECURSE source_files \\\${source_dir}/*.cpp)

FOREACH(subdir \\\${source_files})
  message(STATUS \\\${subdir})
ENDFOREACH()

add_library(
    \$libName
    \"\\\${source_files}\")

\" >> CMakeLists.txt

echo \"
projName=\\\$1
libName=\\\${PWD##*/}
cd build
cmake ..
make

cp lib\\\$libName.a ../../\\\$projName/libs/
cd ..
cd include
cp -r ./ ../../\\\$projName/include/\\\$libName

\" > build.sh

" > create-lib.sh

cd ..