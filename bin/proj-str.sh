#!/bin/sh

projName=$1


mkdir $projName
cd $projName

mkdir include
mkdir libs
mkdir build
mkdir scripts

touch CMakeLists.txt
touch build.sh
touch compile.sh
chmod +x build.sh
chmod +x compile.sh

cd scripts
touch start.sh
touch imp-lib-static.sh
touch imp-lib-dynamic.sh
chmod +x start.sh
chmod +x imp-lib-static.sh
chmod +x imp-lib-dynamic.sh
cd ..

mkdir src
cd src
touch Main.cpp
cd ..