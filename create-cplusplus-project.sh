#!/bin/sh

projName=$1

echo Creating $projName ...

/usr/local/bin/linux-create-cxx-project/bin/proj-str.sh $projName

/usr/local/bin/linux-create-cxx-project/bin/cmake-files.sh $projName

/usr/local/bin/linux-create-cxx-project/bin/scripts.sh $projName

/usr/local/bin/linux-create-cxx-project/bin/sample.sh $projName

cd ${PWD}/$projName-workSpace
git init
git add .
git commit -m "init project using create-cxx-project"
cd $projName
cd build
cmake .. -DCMAKE_BUILD_TYPE=Debug

echo
echo "\e[32m \e[1m cd $projName-workSpace/$projName"
echo "  npm start"

