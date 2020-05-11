#!/bin/sh

projName=$1

echo Creating $projName ...

bin/proj-str.sh $projName

bin/cmake-files.sh $projName

bin/scripts.sh $projName

bin/sample.sh $projName

cd ${PWD}/$projName
./build.sh
echo type [cd $projName]

