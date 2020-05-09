#!/bin/sh

projName=$1


mkdir $projName
cd $projName

mkdir Include

touch CMakeLists.txt
touch build.sh
touch compile.sh
chmod +x build.sh
chmod +x compile.sh

mkdir src
cd src
touch Main.cpp
