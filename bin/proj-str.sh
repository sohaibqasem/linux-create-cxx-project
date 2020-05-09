#!/bin/sh

projName=$1


mkdir $projName
cd $projName

mkdir Include
mkdir build
mkdir scripts

touch CMakeLists.txt
touch build.sh
touch compile.sh
chmod +x build.sh
chmod +x compile.sh

cd scripts
touch start.sh
touch add-library-static.sh
touch import-library-dynamic.sh
chmod +x start.sh
chmod +x add-library-static.sh
chmod +x import-library-dynamic.sh
cd ..

mkdir src
cd src
touch Main.cpp