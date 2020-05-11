#!/bin/sh

projName=$1

echo Creating $projName ...

echo Creating folder structure
/usr/local/bin/linux-create-cxx-project/bin/proj-str.sh $projName
echo Creating $projName ...
/usr/local/bin/linux-create-cxx-project/bin/cmake-files.sh $projName
echo Creating $projName ...
/usr/local/bin/linux-create-cxx-project/bin/scripts.sh $projName
/usr/local/bin/linux-create-cxx-project/bin/sample.sh

echo Created successfully
cd ${PWD}/$projName/scripts
./start
