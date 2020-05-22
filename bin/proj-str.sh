#!/bin/sh

projName=$1

mkdir "$projName-workSpace"
cd "$projName-workSpace"

mkdir $projName
cd $projName

mkdir include
mkdir libs
mkdir build
mkdir scripts

touch CMakeLists.txt

cd scripts

touch start.sh
touch release.sh
touch rebuild.sh
touch create-lib.sh

chmod +x start.sh
chmod +x release.sh
chmod +x rebuild.sh
chmod +x create-lib.sh

cd ..

mkdir src
cd src
touch Main.cpp
cd ..