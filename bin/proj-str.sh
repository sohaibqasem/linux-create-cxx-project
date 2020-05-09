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
touch add-libaray-static.sh
touch add-libaray-dynamic.sh
touch import-lib-dynamic.sh
chmod +x start.sh
chmod +x add-libaray-static.sh
chmod +x add-libaray-dynamic.sh
chmod +x import-lib-dynamic.sh
cd ..

mkdir src
cd src
touch Main.cpp