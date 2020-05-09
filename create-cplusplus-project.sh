#!/bin/sh

projName=$1

echo Creating $projName ...

/usr/local/bin/linux-c++-cli/bin/proj-str.sh $projName
/usr/local/bin/linux-c++-cli/bin/sample-content.sh $projName

cd ${PWD}/$projName
./build.sh
echo type [cd $projName]
