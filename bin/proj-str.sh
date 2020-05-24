#!/bin/sh

projName=$1

mkdir "$projName-workSpace"
cd "$projName-workSpace"

echo "
{
  \"name\": \"$projName\",
  \"version\": \"1.0.0\",
  \"description\": \"\",
  \"main\": \"\",
  \"scripts\": {
    \"test\": \"echo \\\"Error: no test specified\\\" && exit 1\",
    \"start\": \"scripts/start.sh\",
    \"release\": \"scripts/release.sh\",
    \"rebuild\": \"scripts/rebuild.sh\",
    \"exe\": \"$projName/build/$projName\",
    \"create-lib\": \"scripts/create-lib.sh\",
    \"build-lib\": \"bash scripts/build-lib.sh\",
    \"install\": \"mkdir -p scripts && cd scripts && /usr/local/bin/linux-create-cxx-project/bin/scripts.sh $projName && chmod +x start.sh && chmod +x rebuild.sh && chmod +x release.sh && chmod +x create-lib.sh\"
  },
  \"author\": \"\",
  \"license\": \"ISC\"
}
" > package.json

echo "
# See https://help.github.com/articles/ignoring-files/ for more about ignoring files.

# production
build

# dev tools
scripts
package-lock.json

" > .gitignore


mkdir $projName
mkdir scripts

cd $projName
mkdir include
mkdir libs
mkdir build


touch CMakeLists.txt

cd ..
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
cd $projName
mkdir src
cd src
touch Main.cpp
cd ..