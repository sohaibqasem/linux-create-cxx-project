projName=$1

cd $projName-workSpace
cd scripts
echo "
#!/bin/sh
cd \$PWD
cd $projName
cd build
cmake .. -DCMAKE_BUILD_TYPE=Debug
make
FILE=$projName
if [ -f "\$FILE" ]; then
    echo
    echo  \"\e[32m Compilation Secessed\"
    echo
    echo  \"\e[32m To run the exe type\"
    echo      \"\e[32m \e[1m npm run exe\"
    echo
else 
    echo
    echo \"\e[31m Compilation failled\"
    echo
fi
" > start.sh

echo "
#!/bin/sh
cd \$PWD
cd $projName
rm -r build/
mkdir build
cd build
cmake .. -DCMAKE_BUILD_TYPE=Release
make
" > release.sh



echo "
#!/bin/sh
libName=\$1
libType=\$2

if [ \"\$libType\" == \"st\" ]; then
libType=\"STATIC\"
else
    if [ \"\$libType\" == \"dy\" ]; then
    libType=\"SHARED\"
    else
        libType=\"STATIC\"
    fi
fi

echo \$libType

cd \$PWD
mkdir \$libName
cd \$libName
mkdir include
touch include/source.h
mkdir src
touch src/source.cpp
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
    \$libType
    \"\\\${source_files}\")

\" >> CMakeLists.txt

echo \"

#!/bin/sh
libName=\\\$1
projName=\\\$2

cd build
cmake ..
make


if [ -z "\\\$projName" ] 
then
	echo ""
 
else
    echo \\\$PWD
    cp lib\\\$libName.* ../../\\\$projName/libs/
    cd ..
    cd include
    cp -r ./ ../../\\\$projName/include/\\\$libName
fi

\" > build.sh

" > create-lib.sh

echo "

#!/bin/sh
libName=\$1
projName=\$2

cd \$PWD
for d in *; do

    if [ \$d == \$libName ] ; then

    echo \$d
    cd \$d
    ./build.sh \$libName \$projName

    break
    fi

done
" > build-lib.sh

cd ..